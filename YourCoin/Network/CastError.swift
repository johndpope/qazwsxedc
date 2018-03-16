//
//  CastError.swift
//  Test-Wallet
//
//  Created by Juden on 1/2/18.
//  Copyright © 2018 Juden. All rights reserved.
//

import Foundation

struct CastError<ExpectedType>: Error {
    let actualValue: Any
    let expectedType: ExpectedType.Type
}
