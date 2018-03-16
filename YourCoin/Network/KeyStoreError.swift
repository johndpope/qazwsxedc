//
//  KeyStoreError.swift
//  Test-Wallet
//
//  Created by Juden on 11/30/17.
//  Copyright © 2017 Juden. All rights reserved.
//

import Foundation

enum KeyStoreError: LocalizedError {
    case failedToDeleteAccount
    case failedToDecryptKey
    case failedToImport(Error)
    case duplicateAccount
    case failedToSignTransaction
    case failedToUpdatePassword
    case failedToCreateWallet
    case failedToImportPrivateKey
    
    var errorDescription: String? {
        switch self {
        case .failedToDeleteAccount:
            return "Failed to delete account"
        case .failedToDecryptKey:
            return "Could not decrypt key with given passphrase"
        case .failedToImport(let error):
            return error.localizedDescription
        case .duplicateAccount:
            return "You already added this address to wallets"
        case .failedToSignTransaction:
            return "Failed to sign transaction"
        case .failedToUpdatePassword:
            return "Failed to update password"
        case .failedToCreateWallet:
            return "Failed to create wallet"
        case .failedToImportPrivateKey:
            return "Failed to import private key"
        }
    }
}
