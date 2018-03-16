//
//  MainViewController.swift
//  YourCoin
//
//  Created by Juden on 1/19/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    let acservice: AccountService = AccountService()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createWallet(_ sender: Any) {
        acservice.CreateWallet()
        //AccountService.CreateWallet();
    }
    
    @IBAction func getWallets(_ sender: Any) {
        let a: Account! =  acservice.GetCurrentAccount()
        print(a!.address)
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
