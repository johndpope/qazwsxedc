//
//  ImportType.swift
//  Test-Wallet
//
//  Created by Juden on 1/3/18.
//  Copyright © 2018 Juden. All rights reserved.
//

import Foundation

enum ImportType {
    case keystore(string: String, password: String)
    case privateKey(privateKey: String, password: String)
}
