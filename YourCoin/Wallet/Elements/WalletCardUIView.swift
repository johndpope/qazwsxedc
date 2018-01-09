//
//  WalletCardUIView.swift
//  YourCoin
//
//  Created by Some Man on 09.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

func SetLabelInfo(text:String) -> UILabel {
    let some = UILabel()
    some.text = text
    some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    some.font = UIFont(name: "Roboto-Light", size: 16)
    some.font = some.font.withSize(16)
    some.translatesAutoresizingMaskIntoConstraints = false
    return some
}

func SetLabelValue(text:String) -> UILabel {
    let some = UILabel()
    some.text = text
    some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    some.font = UIFont(name: "Roboto-Bold", size: 16)
    some.font = some.font.withSize(16)
    some.translatesAutoresizingMaskIntoConstraints = false
    return some
}

func SetLabelNameValue(text:String) -> UILabel {
    let some = UILabel()
    some.text = text
    some.textColor = UIColor(red: 0.43, green: 0.92, blue: 0.89, alpha: 1)
    some.font = UIFont(name: "Roboto-Black", size: 16)
    some.font = some.font.withSize(16)
    some.translatesAutoresizingMaskIntoConstraints = false
    return some
}


extension UIView : CoinUIView{
    func SetWalletCards(wallet: String, currency: Float, typeCoin: String) ->WalletCardObject  {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0.02, green: 0.16, blue: 0.21, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0;
        
        let infowallelUILabel = SetLabelInfo(text:"WALLET:")
        self.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        
        let infocurrencyUILabel = SetLabelInfo(text:"CURRENCY:")
        self.addSubview(infocurrencyUILabel)
        infocurrencyUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        infocurrencyUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58).isActive = true
        
        let infovauleUILabel = SetLabelInfo(text:"VALUE:")
        self.addSubview(infovauleUILabel)
        infovauleUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        infovauleUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 89).isActive = true
        
        //////
        
        let wallelUILabel = SetLabelValue(text: wallet)
        self.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 99).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        wallelUILabel.widthAnchor.constraint(equalToConstant: 209).isActive = true
        
        let vauleCurrencyUILabel = SetLabelValue(text:String(currency))
        self.addSubview(vauleCurrencyUILabel)
        vauleCurrencyUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 122).isActive = true
        vauleCurrencyUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58).isActive = true
        
        let vauleUILabel = SetLabelValue(text:String(currency+13))
        self.addSubview(vauleUILabel)
        vauleUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 84).isActive = true
        vauleUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 89).isActive = true
        
        //////
        
        let typeCoinCurrencyUILabel = SetLabelNameValue(text:typeCoin)
        self.addSubview(typeCoinCurrencyUILabel)
        typeCoinCurrencyUILabel.leftAnchor.constraint(equalTo: vauleCurrencyUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinCurrencyUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58).isActive = true
        
        let typeCoinUILabel = SetLabelNameValue(text:"USD")
        self.addSubview(typeCoinUILabel)
        typeCoinUILabel.leftAnchor.constraint(equalTo: vauleUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 89).isActive = true
        
        return WalletCardObject(Wallet:wallet, Balance:currency, BalanceToUSD:currency+13)
    }
}
