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
    func SetType()->CoinCards{
        switch self {
        case .eth:
            return CoinCards(name:"Ethereum", reduction:"ETH", icon:UIImage(named: "Clock.png")!)
        case .btc:
            return CoinCards(name:"Bitcoin", reduction:"BTC", icon:UIImage(named: "Clock.png")!)
        }
    }
}



