//
//  TransactionSpeed.swift
//  Test-Wallet
//
//  Created by Juden on 1/2/18.
//  Copyright © 2018 Juden. All rights reserved.
//

import BigInt
import Foundation
import Geth

enum TransactionSpeed {
    case fast
    case regular
    case cheap
    case custom(gasPrice: BigInt, gasLimit: BigInt)
    
    var gasPrice: BigInt {
        switch self {
        case .fast:
            return 6_000_000_000
        case .regular:
            return 2_400_000_000
        case .cheap:
            return 1_000_000_000
        case .custom(let gasPrice, _):
            return gasPrice
        }
    }
    
    var gasLimit: BigInt {
        switch self {
        case .regular, .fast, .cheap:
            return 90_000
        case .custom(_, let gasLimit):
            return gasLimit
        }
    }
}
