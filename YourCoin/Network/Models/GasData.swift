//
//  GasData.swift
//  YourCoin
//
//  Created by Juden on 1/9/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper

class GasData: Mappable {
    var gasLimit: Int?
    var gasLimitHex: String?
    var gasPrice: String?
    var gasPriceHex: String?
    required init?(map: Map) {
        
        
    }
    func mapping(map: Map) {
        gasLimit <- map["gasLimit"]
        gasLimitHex <- map["gasLimitHex"]
        gasPrice <- map["gasPrice"]
        gasPriceHex <- map["gasPriceHex"]
        
    }
    
    
    
}
