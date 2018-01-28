//
//  AccountService.swift
//  YourCoin
//
//  Created by Juden on 1/9/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit
import Geth
import BigInt
import Foundation
import Geth
import APIKit
import JSONRPCKit
import Result
import Foundation
import Geth
import KeychainSwift
import CryptoSwift
import Alamofire


class AccountService {
    let keystore: EtherKeystore = EtherKeystore()

//    let keystore: EtherKeystore = EtherKeystore()
     func CreateWallet() -> Account! {
        var _account: Account!
        let password = UUID().uuidString
        keystore.createAccount(with: password) { result in
            switch result {
            case .success(let account):
                _account! = account
                print("\(account.address)")
                
            case .failure(let error):
                print(error)
            }
            
        }
        return _account!
    }
     func GetCurrentAccount() -> Account? {
        return EtherKeystore.current
    }
     func hasAccounts() -> Account {
        return keystore.recentlyUsedAccount!
    }
    func ImportWallet() {
        
    }
    
    func ExportWallet() {
        
    }
    
    func RemoveWallet() {
        
    }
    
    func GetBallance() {
        
    }
    static func SignUp (login: String, password: String) {
        
    }
    func SignIn () {
        
    }
   
    
    
    
}
