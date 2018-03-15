//
//  BigInt.swift
//  Test-Wallet
//
//  Created by Juden on 1/2/18.
//  Copyright © 2018 Juden. All rights reserved.
//

import BigInt
import Geth

extension BigInt {
    init(_ value: GethBigInt) {
       // print(value.getBytes().hex)
        let magnitude = BigUInt(value.getBytes())
        let sign: Sign
        if value.string().hasPrefix("-") {
            sign = .minus
        } else {
            sign = .plus
        }
        self.init(sign: sign, magnitude: magnitude)
    }
    
    var gethBigInt: GethBigInt {
        let value = GethNewBigInt(0)!
        value.setString(description, base: 10)
        return value
    }
}

