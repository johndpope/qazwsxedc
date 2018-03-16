//
//  CustomView.swift
//  YourCoin
//
//  Created by Some Man on 01.02.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomUIView: UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return UIColor(cgColor: layer.borderColor!) }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}

