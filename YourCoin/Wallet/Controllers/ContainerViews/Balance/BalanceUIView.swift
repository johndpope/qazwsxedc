//
//  BalanceUIView.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 28.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit

class BalanceUIView:  UIViewController {

    let acceptPayButton = UIButton()
    let payNowButton = UIButton()
    let historyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupViews()
        SetLayutConstrain()

    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func SetupViews(){
        acceptPayButton.SetBaseCustomButtonStart()
        acceptPayButton.setTitle("ACCEPT PAY", for: UIControlState.normal )
        self.view.addSubview(acceptPayButton)
        
        payNowButton.SetInvisibleCustomButtonWallet()
        payNowButton.setTitle("PAY NOW", for: UIControlState.normal )
        self.view.addSubview(payNowButton)
        
        historyLabel.SetInfoCustomLabelWallet()
        historyLabel.text = "Transaction history";
        //historyButton.setImage(UIImage(named:"SettingsIcon.png"), for: .normal)
        view.addSubview(historyLabel)
    }
    
    func SetLayutConstrain(){
        acceptPayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        acceptPayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95).isActive = true
        acceptPayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        acceptPayButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        payNowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        payNowButton.bottomAnchor.constraint(equalTo: self.acceptPayButton.bottomAnchor, constant: -65).isActive = true
        payNowButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        payNowButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        historyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        historyLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -370).isActive = true

    }

}
