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
    static func RefreshData(some:String){
        print(some)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       override func viewWillAppear(_ animated: Bool) {
      //  NotificationCenter.default.addObserver(self, selector: #selector(dd), name: NSNotification.Name("dd"), object: nil)
        print(AllCardsViewController.TempCount)
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
