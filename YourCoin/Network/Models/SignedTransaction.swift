//
//  SigndedTransaction.swift
//  YourCoin
//
//  Created by Juden on 2/15/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import ObjectMapper


class SignedTransaction: Mappable {
    var hash: String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        hash <- map["hash"]
    }
}
