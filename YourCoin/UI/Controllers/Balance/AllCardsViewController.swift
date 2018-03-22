//
//  AllCardsViewController.swift
//  YourCoin
//
//  Created by Some Man on 22.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class AllCardsViewController: UIViewController {
    
    @IBOutlet weak var SendRaciveUIButton: UIButton!
    @IBOutlet weak var RateViewUIButton: UIButton!
    @IBOutlet weak var TransactionViewUIButton: UIButton!
    
    @IBOutlet weak var SendReciveUIView: UIView!
    @IBOutlet weak var RateUIView: UIView!
    @IBOutlet weak var TransactionsUIView: UIView!
    // static var walletCards:WalletUIPageViewController?
    static var TempCount:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
       override func viewWillAppear(_ animated: Bool) {
        SendReciveUIView.isHidden = false
        RateUIView.isHidden = true
        TransactionsUIView.isHidden = true
        print(AllCardsViewController.TempCount ?? "nil")
      }
    @IBAction func ClickPageMenu(_ sender: UIButton) {
        print("->Click Page menu:")
        switch sender.accessibilityIdentifier {
        case "sendrecive"?:
            print(" -sendrecive view")
            SendReciveUIView.isHidden = false
            RateUIView.isHidden = true
            TransactionsUIView.isHidden = true
        case "rate"?:
            print(" -rate view")
            SendReciveUIView.isHidden = true
            RateUIView.isHidden = false
            TransactionsUIView.isHidden = true
        case "transactions"?:
            print(" -transactions view")
            SendReciveUIView.isHidden = true
            RateUIView.isHidden = true
            TransactionsUIView.isHidden = false
        default:
            print("error")
        }
    }
    
    static func RefreshData(some:String){
        print(some)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
