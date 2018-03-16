//
//  TransactionStatus.swift
//  YourCoin
//
//  Created by Juden on 1/31/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation


class TransactionStatus {
    
    var blockHash: Any!
    var blockNumber: Any {
        get {
            if blockNumber == nil {return "Pending"}
            return "Ready"
        }
    }
    var from: Any!
    var gas: Any!
    var gasPrice: Any!
    var hash: Any!
    var input: Any!
    var nonce: Any!
    var to: Any!
    var transactionIndex: Any!
    var value: Any!
    var v:Any!
    var r:Any!
    var s:Any!
}
