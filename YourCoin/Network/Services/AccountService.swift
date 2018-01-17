//
//  AccountService.swift
//  YourCoin
//
//  Created by Juden on 1/9/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation


class AccountService {
    
    public let keystore: EtherKeystore = EtherKeystore()
    static func CreateWallet()  {
        let password = UUID().uuidString
        keystore.createAccount(with: password) { result in
            switch result {
            case .success(let account):
                print("\(account.address)")
            case .failure(let error):
                print(error)
            }
        }
    }
    static func GetCurrentAccount() -> Account {
        return keystore.current
    }
    static func hasAccounts() -> Bool {
        return keystore.hasAccounts
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
