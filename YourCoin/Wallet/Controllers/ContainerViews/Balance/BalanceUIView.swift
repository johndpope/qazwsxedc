//
//  Balance.swift
//  YourCoin
//
//  Created by Some Man on 06.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import PureLayout

class BalanceUIView: UIView, ViewFragmet {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let acceptPayButton = UIButton()
    let payNowButton = UIButton()
    let historyLabel = UILabel()
    
    func SetupViews(){
        acceptPayButton.SetBaseCustomButtonStart()
        acceptPayButton.setTitle("ACCEPT PAY", for: UIControlState.normal )
        self.addSubview(acceptPayButton)
        
        payNowButton.SetInvisibleCustomButtonWallet()
        payNowButton.setTitle("PAY NOW", for: UIControlState.normal )
        payNowButton.addTarget(self, action: #selector(SwitchButtonAction), for: .touchUpInside)
        self.addSubview(payNowButton)
        
        historyLabel.SetInfoCustomLabelWallet()
        historyLabel.text = "Transaction history";
        //historyButton.setImage(UIImage(named:"SettingsIcon.png"), for: .normal)
        self.addSubview(historyLabel)
    }
    
    @objc func SwitchButtonAction(_ sender: UIButton) {
        print("test")
    }
    
    func SetLayutConstrain(){
        acceptPayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        acceptPayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -95).isActive = true
        acceptPayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        acceptPayButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        payNowButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        payNowButton.bottomAnchor.constraint(equalTo: self.acceptPayButton.bottomAnchor, constant: -65).isActive = true
        payNowButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        payNowButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        historyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        historyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -370).isActive = true
        
    }
}
