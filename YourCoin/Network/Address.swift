//
//  Address.swift
//  Test-Wallet
//
//  Created by Juden on 11/30/17.
//  Copyright © 2017 Juden. All rights reserved.
//
import Foundation

struct Address {
    
    let address: String
    
    init(address: String) {
        self.address = address.lowercased()
    }
}

extension Address: Equatable {
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.address == rhs.address
    }
}
