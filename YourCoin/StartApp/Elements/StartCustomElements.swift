//
//  StartCustomButton.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 25.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import Foundation
import UIKit

extension UITextField : CoinTextFieldStart{
    
    func SetCustomTextFieldStart(placeholder:String) -> Void{
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 2;
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.layer.borderColor = UIColor.cyan.cgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor : UIColor.darkGray])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton : CoinButtonStart {
    func SetBaseCustomButtonStart() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0;
        self.backgroundColor = UIColor.cyan
        self.setTitleColor(UIColor.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    func SetSecondCustomButtonStart(){
        self.backgroundColor = .clear
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


