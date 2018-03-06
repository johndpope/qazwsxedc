//
//  EtherKeystore.swift
//  Test-Wallet
//
//  Created by Juden on 11/30/17.
//  Copyright © 2017 Juden. All rights reserved.
//


import Foundation
import Geth
import Result
import KeychainSwift
import CryptoSwift

class EtherKeystore: Keystore {

    struct Keys {
        static let recentlyUsedAddress: String = "recentlyUsedAddress"
    }
    private let keychain: KeychainSwift
    let datadir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    let gethKeyStorage: GethKeyStore
    init(keychain: KeychainSwift = KeychainSwift(keyPrefix: "testtest"),
         keyStoreSubfolder: String = "/keystore") {
        let keydir = datadir + keyStoreSubfolder
        self.keychain = keychain
        self.keychain.synchronizable = false
        self.gethKeyStorage = GethNewKeyStore(keydir, GethLightScryptN, GethLightScryptP)
    }
    var hasAccounts: Bool {
        return !accounts.isEmpty
    }
    
    var recentlyUsedAccount: Account? {
        set {
            keychain.set(newValue?.address.address ?? "", forKey: Keys.recentlyUsedAddress)
        }
        get {
            let address = keychain.get(Keys.recentlyUsedAddress)
            return accounts.filter { $0.address.address == address }.first
        }
    }
    
    static var current: Account? {
        return EtherKeystore().recentlyUsedAccount
    }
    var accounts: [Account] {
        return self.gethAccounts.map { Account(address: Address(address: $0.getAddress().getHex())) }
    }
    
    var gethAccounts: [GethAccount] {
        var finalAccounts: [GethAccount] = []
        let allAccounts = gethKeyStorage.getAccounts()
        let size = allAccounts?.size() ?? 0
        
        for i in 0..<size {
            if let account = try! allAccounts?.get(i) {
                finalAccounts.append(account)
            }
        }
        
        return finalAccounts
    }
    func createAccount(with password: String, completion: @escaping (Result<Account, KeyStoreError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let account = self.createAccout(password: password)
            DispatchQueue.main.async {
                completion(.success(account))
            }
        }
    }
    func createAccout(password: String) -> Account {
        let gethAccount = try! gethKeyStorage.newAccount(password)
        let account: Account = .from(account: gethAccount)
        let _ = setPassword(password, for: account)
        return account
    }
    @discardableResult
    func setPassword(_ password: String, for account: Account) -> Bool {
        return keychain.set(password, forKey: account.address.address.lowercased())
    }
    func signTransaction(
        _ signTransaction: SignTransaction
        ) -> Result<Data, KeyStoreError> {
        let gethAddress = GethNewAddressFromHex(signTransaction.address.address, nil)
        let transaction = GethNewTransaction(
            numericCast(signTransaction.nonce),
            gethAddress,
            signTransaction.amount,
            Int64("\(signTransaction.speed.gasLimit.gethBigInt)")!, //signTransaction.speed.gasLimit.gethBigInt
            signTransaction.speed.gasPrice.gethBigInt,
            signTransaction.data
        )
        let password = getPassword(for: signTransaction.account)
        
        let gethAccount = getGethAccount(for: signTransaction.account.address)
        
        do {
            try gethKeyStorage.unlock(gethAccount, passphrase: password)
            defer {
                do {
                    try gethKeyStorage.lock(gethAccount.getAddress())
                } catch {}
            }
            let signedTransaction = try gethKeyStorage.signTx(
                gethAccount,
                tx: transaction,
                chainID: signTransaction.chainID
            )
            let rlp = try signedTransaction.encodeRLP()
            return .success(rlp)
        } catch {
            return .failure(.failedToSignTransaction)
        }
    }
    func getPassword(for account: Account) -> String? {
        return keychain.get(account.address.address.lowercased())
    }
    func getGethAccount(for address: Address) -> GethAccount {
        return gethAccounts.filter { Address(address: $0.getAddress().getHex()) == address }.first!
    }
    
    func importWallet(type: ImportType) {
        switch type {
        case .keystore(let string, let password):
            importKeystore(
                value: string,
                password: password
                //completion: completion
            )
        case .privateKey(let privateKey, let password):
            self.keystore(for: privateKey, password: password) { result in
                switch result {
                case .success(let value):
                    self.importKeystore(
                        value: value,
                        password: password
                        //completion: completion
                    )
                case .failure(let error):
                    print(error)
                    //completion(.failure(error))
                }
            }
        }
    }
    
    func keystore(for privateKey: String, password: String, completion: @escaping (Result<String, KeyStoreError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let keystore = self.convertPrivateKeyToKeystoreFile(
                privateKey: privateKey,
                passphrase: password
            )
            DispatchQueue.main.async {
                switch keystore {
                case .success(let result):
                    print(result)
                    //completion(.success(result.jsonString ?? ""))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func importKeystore(value: String, password: String, completion: @escaping (Result<Account, KeyStoreError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let result = self.importKeystore(value: value, password: password)
            DispatchQueue.main.async {
                switch result {
                case .success(let account):
                    completion(.success(account))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    func importKeystore(value: String, password: String) -> Result<Account, KeyStoreError> {
        let data = value.data(using: .utf8)
        do {
            let gethAccount = try gethKeyStorage.importKey(data, passphrase: password, newPassphrase: password)
            
            //Hack to avoid duplicate accounts
            let accounts = gethAccounts.filter { $0.getAddress().getHex() == gethAccount.getAddress().getHex() }
            if accounts.count >= 2 {
                do {
                    try gethKeyStorage.delete(gethAccount, passphrase: password)
                } catch {
                    return (.failure(.failedToImport(error)))
                }
                return (.failure(.duplicateAccount))
            }
            
            let account: Account = .from(account: gethAccount)
            let _ = setPassword(password, for: account)
            return .success(account)
        } catch {
            return .failure(.failedToImport(error))
        }
    }
    func convertPrivateKeyToKeystoreFile(privateKey: String, passphrase: String) -> Result<[String: Any], KeyStoreError> {
        guard let privateKeyData = Data(fromHexEncodedString: privateKey) else {
            return .failure(KeyStoreError.failedToImportPrivateKey)
        }
        let privateKeyBytes: [UInt8] = Array(privateKeyData)
        do {
            let passphraseBytes: [UInt8] = Array(passphrase.utf8)
            // reduce this number for higher speed. This is the default value, though.
            let numberOfIterations = 2214
            
            // derive key
            let salt: [UInt8] = AES.randomIV(32)
            let derivedKey = try PKCS5.PBKDF2(password: passphraseBytes, salt: salt, iterations: numberOfIterations, variant: .sha256).calculate()
            
            // encrypt
            let iv: [UInt8] = AES.randomIV(AES.blockSize)
            let aes = try AES(key: Array(derivedKey[..<16]), blockMode: .CTR(iv: iv), padding: .noPadding)
            let ciphertext = try aes.encrypt(privateKeyBytes)
            
            // calculate the mac
            let macData = Array(derivedKey[16...]) + ciphertext
            let mac = SHA3(variant: .keccak256).calculate(for: macData)
            
            /* convert to JSONv3 */
            
            // KDF params
            let kdfParams: [String: Any] = [
                "prf": "hmac-sha256",
                "c": numberOfIterations,
                "salt": salt.toHexString(),
                "dklen": 32,
                ]
            
            // cipher params
            let cipherParams: [String: String] = [
                "iv": iv.toHexString(),
                ]
            
            // crypto struct (combines KDF and cipher params
            var cryptoStruct = [String: Any]()
            cryptoStruct["cipher"] = "aes-128-ctr"
            cryptoStruct["ciphertext"] = ciphertext.toHexString()
            cryptoStruct["cipherparams"] = cipherParams
            cryptoStruct["kdf"] = "pbkdf2"
            cryptoStruct["kdfparams"] = kdfParams
            cryptoStruct["mac"] = mac.toHexString()
            
            // encrypted key json v3
            let encryptedKeyJSONV3: [String: Any] = [
                "crypto": cryptoStruct,
                "version": 3,
                "id": "",
                ]
            return .success(encryptedKeyJSONV3)
        } catch {
            return .failure(KeyStoreError.failedToImportPrivateKey)
        }
    }

}
extension Account {
    static func from(account: GethAccount) -> Account {
        return Account(
            address: Address(address: account.getAddress().getHex())
        )
    }
}

