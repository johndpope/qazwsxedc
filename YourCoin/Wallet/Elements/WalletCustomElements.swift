//
//  WalletCustomElements.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 25.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import Foundation
import UIKit

extension UIButton : CoinButtonWallet{
    func SetBaseCustomButtonWallet() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0;
        self.backgroundColor = UIColor.cyan
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = UIFont(name: "SFUIDisplay-Bold", size: 24)!
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetInvisibleCustomButtonWallet() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 2;
        self.layer.borderColor = UIColor.cyan.cgColor
        self.setTitleColor(UIColor.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetSwitchCustomButtonWallet() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.titleLabel?.font =  UIFont(name: "SFUIDisplay-Regular", size: 16)
        
    }
    
    func SetSettingsCustomButtonWallet() {
        self.setImage(UIImage(named:"SettingsIcon.png"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel : CoinLabelWallet {
    func SetBaseCustomLabelWallet() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetInfoCustomLabelWallet() {
        self.textColor = UIColor.white
        self.font = UIFont(name: "Roboto-Light", size: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetColorCustomLabelWallet() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField : CoinTextFieldWallet {
    func SetCustomTextFieldWallet(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}






