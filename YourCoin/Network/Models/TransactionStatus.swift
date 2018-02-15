//
//  TransactionStatus.swift
//  YourCoin
//
//  Created by Juden on 1/31/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper

class TransactionStatus: Mappable {
    
    var blockHash: Any?
    var blockNumber: Any?
    var from: String?
    var gas: Any?
    var gasPrice: Any?
    var hash: Any?
    var input: String?
    var nonce: Any?
    var to: String?
    var transactionIndex: Any?
    var value: Any?
    var v:String?
    var r:String?
    var s:String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        blockHash <- map["blockHash"]
        blockNumber <- map["blockNumber"]
        from <- map["from"]
        gas <- map["from"]
        gasPrice <- map["gasPrice"]
        hash <- map["hash"]
        input <- map["hash"]
        nonce <- map["nonce"]
        to <- map["to"]
        transactionIndex <- map["transactionIndex"]
        value <- map["value"]
        v <- map["v"]
        r <- map["r"]
        s <- map["s"]
        
    }
}
