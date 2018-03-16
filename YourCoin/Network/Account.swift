//
//  Account.swift
//  Test-Wallet
//
//  Created by Juden on 11/30/17.
//  Copyright © 2017 Juden. All rights reserved.
//

import Foundation
import Geth

struct Account {
    var address: Address
    
    init(address: Address) {
        self.address = address
    }
}

extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.address.address == rhs.address.address
    }
}
