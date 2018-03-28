//
//  CoinCards.swift
//  YourCoin
//
//  Created by Some Man on 28.03.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

struct CoinCards{
    init(name:String, reduction:String, icon:UIImage ){
        self.name = name
        self.reduction = reduction
        self.icon = icon
    }
    var name:String?
    var reduction:String?
    var icon:UIImage?
}
