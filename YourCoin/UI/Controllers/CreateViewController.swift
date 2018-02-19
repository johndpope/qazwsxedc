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
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        accountService.GetAccounts(){
            response, error in
            
            if response!.count > 0 {
                self.performSegue(withIdentifier: "GoToMain", sender: self)
            }
            else {
            }
            // Do any additional setup after loading the view.
        }
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
//        self.accountService.GetAccounts() {
//            response, error in
//            print("Your wallets:")
//            for item in response!
//            {
//                print(item.address.address)
//
//            }
//        }
    
    }
    @IBAction func CreateWalletAction(_ sender: Any) {
        //let _etherService: EthereumDataService = EthereumDataService()
        //let accountService: AccountService = AccountService()
        
     
            self.accountService.CreateWallet() {
                response, error in print(response?.address)
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
