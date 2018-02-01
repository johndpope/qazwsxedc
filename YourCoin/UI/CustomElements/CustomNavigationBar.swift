//
//  CustomNavigationBar.swift
//  YourCoin
//
//  Created by Some Man on 01.02.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomNavigationBar: UINavigationBar{
    
    @IBInspectable var barOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
}
