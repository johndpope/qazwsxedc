//
//  BalanceUIView.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 28.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit

class BalanceUIViewController:  UIViewController {
    
    var balanceUIView = BalanceUIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(balanceUIView)
        balanceUIView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        balanceUIView.SetupViews()
        balanceUIView.SetLayutConstrain()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
