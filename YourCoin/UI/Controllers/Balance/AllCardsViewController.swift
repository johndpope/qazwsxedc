//
//  AllCardsViewController.swift
//  YourCoin
//
//  Created by Some Man on 22.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class AllCardsViewController: UIViewController {
    
   // static var walletCards:WalletUIPageViewController?
    static var TempCount:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
       override func viewWillAppear(_ animated: Bool) {
      //  NotificationCenter.default.addObserver(self, selector: #selector(dd), name: NSNotification.Name("dd"), object: nil)
        print(AllCardsViewController.TempCount)
      }
    
    static func RefreshData(some:String){
        print(some)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
