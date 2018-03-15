//
//  Balance.swift
//  YourCoin
//
//  Created by Juden on 2/15/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper

class Balance: Mappable {
    var balance: String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        balance <- map["balance"]
    }
}
