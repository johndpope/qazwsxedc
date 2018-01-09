//
//  WalletCardObject.swift
//  YourCoin
//
//  Created by Some Man on 09.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation

class WalletCardObject  {
    init(Wallet:String, Balance:Float, BalanceToUSD:Float)
    {
        walletPublicKey = Wallet
        balance = Balance
        balanceToUSD = BalanceToUSD
    }
    public var walletPublicKey:String
    public var balance:Float
    public var balanceToUSD:Float
}
