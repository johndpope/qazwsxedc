//
// Created by Juden on 2/1/18.
// Copyright (c) 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper

class CryptoCurrency: Mappable {
    var time: UInt32?
    var price: Double?
    var hour: [Hours]?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        time <- map["time"]
        price <- map["price"]
        hour <- map["hour"]
        }

}
