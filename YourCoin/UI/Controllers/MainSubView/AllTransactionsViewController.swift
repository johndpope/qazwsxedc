//
//  AllTransactionsViewController.swift
//  YourCoin
//
//  Created by Some Man on 29.03.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class AllTransactionsViewController: UIViewController, WalletUIPageProtocol  {

    static var walletUIPageViewController:WalletUIPageViewController?
    var walletIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

    static func RefreshData(index:Int)->Int{   //доработать
        AllCardsViewController.walletIndex = index
        print(AllCardsViewController.walletIndex)
        return index
    }
}
