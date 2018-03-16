//
//  WalletCardObject.swift
//  YourCoin
//
//  Created by Some Man on 09.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation

class WalletCardObject  {
    init(Wallet:String, Balance:Float, PriceToUSD:Float, TypeCoin:String)
    {
        walletPublicKey = Wallet
        balance = Balance
        priceToUSD = PriceToUSD
        typeCoin = TypeCoin
    }
    public var walletPublicKey:String
    public var balance:Float
    public var priceToUSD:Float
    public var typeCoin:String
}


