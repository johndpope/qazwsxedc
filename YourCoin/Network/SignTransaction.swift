//
//  SignTransaction.swift
//  Test-Wallet
//
//  Created by Juden on 1/2/18.
//  Copyright © 2018 Juden. All rights reserved.
//

import Foundation

import Geth

public struct SignTransaction {
    let amount: GethBigInt
    let account: Account
    let address: Address
    let nonce: Int
    let speed: TransactionSpeed
    let data: Data
    let chainID: GethBigInt
}
