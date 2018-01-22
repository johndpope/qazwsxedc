//
//  BalanceViewController.swift
//  YourCoin
//
//  Created by Some Man on 18.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func PayNowAction(_ sender: Any) {
        print("->Pay Now")

    }
    
    @IBAction func AcceptNowAction(_ sender: CustomUIButton) {
        print("->Accept Now")

    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
