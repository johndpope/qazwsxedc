//
//  WalletCardObject.swift
//  YourCoin
//
//  Created by Some Man on 09.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

class WalletCardObject  {
    public var walletPublicKey:String
    public var balance:String
    public var priceToUSD:String
    public var typeCoin:TypeCoin
    
    init(Wallet:String, Balance:String, PriceToUSD:String, TypeCoin:TypeCoin){
        walletPublicKey = Wallet
        balance = Balance
        priceToUSD = PriceToUSD
        typeCoin = TypeCoin
    }
    
    public func GetCardsUIView()->UIViewController{
        return WalletCardViewController().SetValueCard(walletPublicKey: walletPublicKey , balance: balance, priceToUSD: priceToUSD, typeCoin: typeCoin)
    }
}

