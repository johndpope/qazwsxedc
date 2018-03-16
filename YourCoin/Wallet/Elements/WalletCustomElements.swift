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
        self.titleLabel?.font = self.titleLabel?.font.withSize(CGFloat(24))
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
        self.titleLabel?.font = self.titleLabel?.font.withSize(CGFloat(16))
        
    }
    
    func SetSettingsCustomButtonWallet() {
        self.setImage(UIImage(named:"SettingsIcon.png"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetCustomBackButton(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.setImage(UIImage(named:"Back.png"), for: .normal)
        self.setTitle("Back", for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        self.imageRect(forContentRect: CGRect(x: 13, y: 21, width: 1, height: 1))
        self.titleEdgeInsets = UIEdgeInsets(top: 6,left: 11,bottom: 6,right: 14)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}

extension UILabel : CoinLabelWallet {
    func SetBaseCustomLabelWallet() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func SetInfoCustomLabelWallet(text:String, size:GLfloat, color:UIColor) {
        self.text = text
        self.textColor = color
        self.font = UIFont(name: "Roboto-Light", size: CGFloat(size))
        self.font = self.font.withSize(CGFloat(size))
        self.translatesAutoresizingMaskIntoConstraints = false
    }
 
}

extension UITextField : CoinTextFieldWallet {
    func SetCustomTextFieldWallet(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}






