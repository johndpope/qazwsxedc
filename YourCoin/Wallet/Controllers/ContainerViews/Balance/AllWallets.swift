//
//  AllWallets.swift
//  YourCoin
//
//  Created by Some Man on 06.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import PureLayout

class AllWallets: UIView, ViewFragmet {
    
    let label = UILabel()
    
    
    func SetupViews() {
        label.text = "Some text"
        label.textColor = UIColor.white
        self.addSubview(label)
    }
    
    func SetLayutConstrain() {
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
