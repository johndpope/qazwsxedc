//
//  TypeCoin .swift
//  YourCoin
//
//  Created by Some Man on 27.03.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

enum TypeCoin {
    case eth, btc
    func GetType()->CoinCards{
        switch self {
        case .eth:
            return CoinCards(name:"Ethereum", reduction:"ETH", icon: #imageLiteral(resourceName: "EthereumIcon")) // тут есть icon
        case .btc:
            return CoinCards(name:"Bitcoin", reduction:"BTC", icon:#imageLiteral(resourceName: "EthereumIcon")) // тут есть icon
        }
    }
}



