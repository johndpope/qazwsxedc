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
    var cardobj:WalletCardObject? = nil
    let smallHistoryView = UIView()
    
    func SetupViews() {
        cardobj = walletCards.SetWalletCards(wallet: "0xB9335eC1C88AA481042537eD36ba0baA6CB49e87", currency: 1488.13, typeCoin: "ETH")
        walletCards.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (HowKeyAll (_:))))
        self.addSubview(walletCards)
        
        smallHistoryView.translatesAutoresizingMaskIntoConstraints = false
        smallHistoryView.backgroundColor = UIColor.brown
        self.addSubview(smallHistoryView)
        
        confirmButton.SetBaseCustomButtonStart()
        confirmButton.setTitle("ACCEPT PAY", for: UIControlState.normal )
        confirmButton.addTarget(self, action: #selector(ConfirmButtonAction), for: .touchUpInside)
        self.addSubview(confirmButton)
        
    }
    
    @objc func ConfirmButtonAction(_ sender: UIButton){
        print("->confirmButton")
    }
    
    @objc func HowKeyAll(_ sender: UIButton){
        print(cardobj?.walletPublicKey)
    }

    func SetLayutConstrain() {
        confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -95).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        smallHistoryView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        smallHistoryView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        smallHistoryView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -46).isActive = true
        smallHistoryView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        walletCards.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        walletCards.topAnchor.constraint(equalTo: self.topAnchor, constant: 116).isActive = true
        walletCards.widthAnchor.constraint(equalToConstant: 330).isActive = true
        walletCards.heightAnchor.constraint(equalToConstant: 136).isActive = true
    }
    
}




