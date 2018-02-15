//
//  Hours.swift
//  YourCoin
//
//  Created by Juden on 2/8/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper


class Hours : Mappable {
    var time: CLong?
    var price: Double?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        time <- map["time"]
        price <- map["price"]
    }
}
