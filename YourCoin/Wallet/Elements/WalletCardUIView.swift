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

extension UITextField : CoinTextFieldWallet {
    func SetCustomTextFieldWallet(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView : CoinUIView{
    func SetWalletCards(wallet: String, currency: GLfloat, typeCoin: String) {
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
        
        let currencyUILabel = SetLabelValue(text:"CURRENCY:")
        self.addSubview(currencyUILabel)
        currencyUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 122).isActive = true
        currencyUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58).isActive = true
        
        let vauleUILabel = SetLabelValue(text:"VALUE:")
        self.addSubview(vauleUILabel)
        vauleUILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 84).isActive = true
        vauleUILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 89).isActive = true
        
        
    }
}
