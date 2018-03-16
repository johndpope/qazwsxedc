//
//  CreateViewController.swift
//  YourCoin
//
//  Created by Some Man on 23.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func CreateWalletAction(_ sender: Any) {
        let _accountService: AccountService = AccountService()
        DispatchQueue.main.async {
           var account =  _accountService.CreateWallet()
        }
        //create wallet
        self.performSegue(withIdentifier: "GoToMain", sender: self)
        
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
