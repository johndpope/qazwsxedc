//
//  CreateViewController.swift
//  YourCoin
//
//  Created by Some Man on 23.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    let accountService: AccountService = AccountService()
    let accountStorage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCachedAccount()
        
    }
    func getCachedAccount (){
//       let lastAccoount = 1
//       accountStorage.set(lastAccoount, forKey:"current_account")
         print(accountStorage.value(forKey: "current_account"))
        
    }
    @IBAction func getWallet(_ sender: Any) {
        self.accountService.GetCurrentAccount{
            response, error in
            if let account = response {
                print(account.address)
            }
            else {
                print(error)
            }
        }
    }
    @IBAction func CreateWalletAction(_ sender: Any) {
        self.accountService.CreateWallet() {
            response, error in print(response?.address)
        }
    }

    @IBAction func exportWallet(_ sender: Any) {
        self.accountService.GetCurrentAccount{
            response, error in
            if let account = response {
                self.accountService.ExportWallet(account: account, password: "123456", newPassword: "123456")
            }
            else {
                print(error)
                
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
