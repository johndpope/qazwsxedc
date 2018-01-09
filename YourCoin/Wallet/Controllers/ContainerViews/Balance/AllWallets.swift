//
//  AllWallets.swift
//  YourCoin
//
//  Created by Some Man on 06.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import PureLayout

class AllWallets: UIView, ViewFragmet {
    
    let confirmButton = UIButton()
    let walletCards = UIView()
    
    func SetupViews() {
        
        walletCards.SetWalletCards(wallet: "0xdthjnbvcdrgbvcdgbvcfgvfvdsgbgb", currency: 1488, typeCoin: "ETH")
        self.addSubview(walletCards)
        
        confirmButton.SetBaseCustomButtonStart()
        confirmButton.setTitle("ACCEPT PAY", for: UIControlState.normal )
        confirmButton.addTarget(self, action: #selector(ConfirmButtonAction), for: .touchUpInside)
        self.addSubview(confirmButton)
        
    }
    
    @objc func ConfirmButtonAction(_ sender: UIButton){
        print("->confirmButton")
    }

    func SetLayutConstrain() {
        confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -95).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        walletCards.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        walletCards.topAnchor.constraint(equalTo: self.topAnchor, constant: 116).isActive = true
        walletCards.widthAnchor.constraint(equalToConstant: 330).isActive = true
        walletCards.heightAnchor.constraint(equalToConstant: 136).isActive = true
        
        
    }
}





