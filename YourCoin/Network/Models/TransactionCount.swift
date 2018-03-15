//
//  TransactionCount.swift
//  YourCoin
//
//  Created by Juden on 2/7/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper


class TransactionCount : Mappable {
    var transactionCount: String?
    
    required init(map: Map) {
        
    }
    func mapping(map: Map) {
        transactionCount <- map["TransactionCount"]
    }
}
