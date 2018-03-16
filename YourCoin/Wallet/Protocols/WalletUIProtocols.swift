//
//  UIProtocols.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 25.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import Foundation
import UIKit

protocol CoinButtonWallet{
    func SetBaseCustomButtonWallet()
    func SetInvisibleCustomButtonWallet()
    func SetSwitchCustomButtonWallet()  
    func SetSettingsCustomButtonWallet()
    func SetCustomBackButton()
}

protocol CoinTextFieldWallet {
    func SetCustomTextFieldWallet(placeholder:String)
}

protocol CoinLabelWallet {
    func SetBaseCustomLabelWallet()
    func SetInfoCustomLabelWallet(text:String, size:GLfloat, color:UIColor)
}

protocol CoinUIView {
    func SetWalletCards(wallet:String, currency:Float, typeCoin:String)->WalletCardObject
}

