//
//  CardViewController.swift
//  YourCoin
//
//  Created by Some Man on 24.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class WalletCardViewController: UIViewController {

    var infowallelUILabel = UILabel()
    var infocurrencyUILabel = UILabel()
    var wallelUILabel = UILabel()
    var vauleCurrencyUILabel = UILabel()
    var typeCoinCurrencyUILabel = UILabel()
    var typeCoinUILabel = UILabel()
    
    var walletCardObject:WalletCardObject? = WalletCardObject(Wallet:"-----", Balance:0, PriceToUSD:0, TypeCoin:"--")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.16, blue: 0.21, alpha: 1)
        self.view.layer.cornerRadius = 10
        self.view.layer.borderWidth = 0;
        
        infowallelUILabel = SetCustomLabel(text:"WALLET:", style: "Roboto-Light")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 27).isActive = true
        
        infocurrencyUILabel = SetCustomLabel(text:"CURRENCY:", style: "Roboto-Light")
        self.view.addSubview(infocurrencyUILabel)
        infocurrencyUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infocurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        infowallelUILabel = SetCustomLabel(text:"VALUE:", style: "Roboto-Light")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true
        
        //////
        
        wallelUILabel = SetCustomLabel(text: (walletCardObject?.walletPublicKey)!, style:"Roboto-Bold")
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 99).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 27).isActive = true
        wallelUILabel.widthAnchor.constraint(equalToConstant: 209).isActive = true
        
        vauleCurrencyUILabel = SetCustomLabel(text:String(describing: (walletCardObject?.balance)!), style:"Roboto-Bold")
        self.view.addSubview(vauleCurrencyUILabel)
        vauleCurrencyUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 122).isActive = true
        vauleCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        wallelUILabel = SetCustomLabel(text:String((walletCardObject?.balance)!*(walletCardObject?.priceToUSD)!), style:"Roboto-Bold")
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 84).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true
        
        //////
        
        typeCoinCurrencyUILabel = SetCustomLabel(text:(walletCardObject?.typeCoin)!, style:"Roboto-Black")
        self.view.addSubview(typeCoinCurrencyUILabel)
        typeCoinCurrencyUILabel.leftAnchor.constraint(equalTo: vauleCurrencyUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        typeCoinUILabel = SetCustomLabel(text:"USD", style:"Roboto-Black")
        self.view.addSubview(typeCoinUILabel)
        typeCoinUILabel.leftAnchor.constraint(equalTo: wallelUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true

    }
    
    public func SetCardsView(CardInfo:WalletCardObject){
         self.walletCardObject = CardInfo//WalletCardObject(Wallet:"-----", Balance:13, PriceToUSD:29, TypeCoin:"ETH")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


 

    private func SetCustomLabel(text:String, style:String) -> UILabel {
        let some = UILabel()
        some.text = text
        some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        some.font = UIFont(name: style, size: 16)
        some.font = some.font.withSize(16)
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
}

