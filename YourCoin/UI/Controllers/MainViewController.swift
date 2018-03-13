//
//  MainViewController.swift
//  YourCoin
//
//  Created by Some Man on 17.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    ////// залупа конская
    @IBOutlet weak var BalanceView: UIView!
    @IBOutlet weak var ExchangeRatesView: UIView!
    @IBOutlet weak var BalanceButton: UIButton!
    @IBOutlet weak var ExchangeRatesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BalanceView.isHidden = false
        ExchangeRatesView.isHidden = true
        BalanceButton.setTitleColor(UIColor.cyan, for: .normal)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("успех")
        self.view.endEditing(true)
    }
    
    @IBAction func SwichButton(_ sender: UIButton) {
        print("->Click Swich Buttons" , sender.titleLabel?.text ?? "error" )
        
        if(sender.titleLabel?.text == "Balance") {
            BalanceView.isHidden = false
            ExchangeRatesView.isHidden = true
            sender.setTitleColor(UIColor.cyan, for: .normal)
            ExchangeRatesButton.setTitleColor(UIColor.white, for: .normal)
        }
        else if (sender.titleLabel?.text == "Exchange Rates"){
            self.view.endEditing(true)
            BalanceView.isHidden = true
            ExchangeRatesView.isHidden = false
            sender.setTitleColor(UIColor.cyan, for: .normal)
            BalanceButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    @IBAction func GetSetting(_ sender: Any) {
        print("->Get Setting Button")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
