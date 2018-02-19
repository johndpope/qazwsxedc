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
    func CreateWallet(completionHandler: @escaping (Account?, Error?) -> ()) {
        let password = UUID().uuidString
        keystore.createAccount(with: password) { result in
            switch result {
            case .success(let account):
                completionHandler(account, nil)
                print("\(account.address)")
                
            case .failure(let error):
                completionHandler(nil, error)
                print(error)
            }
            
        }
    }
     func GetCurrentAccount(completionHandler: @escaping (Account?, Error?) -> ()){
        completionHandler(keystore.current, nil)
    }
    func GetAccounts(completionHandler: @escaping ([Account]?, Error?) -> ()) {
        completionHandler(keystore.accounts, nil)
    }
     func hasAccounts(completionHandler: @escaping (Account?, Error?) -> ()) {
        completionHandler(keystore.recentlyUsedAccount, nil)
        //return
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
