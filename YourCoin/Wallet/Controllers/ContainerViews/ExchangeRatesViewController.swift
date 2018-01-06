//
//  ExchangeRatesViewController.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 29.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit

class ExchangeRatesViewController: UIViewController {

    var chartUIView = ChartUIView()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUIView(viewFragmet: chartUIView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    public func SetUIView(viewFragmet:UIView)
    {
        let some:ViewFragmet = viewFragmet as! ViewFragmet
        self.view.addSubview(some as! UIView)
        (some as! UIView).autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        some.SetupViews()
        some.SetLayutConstrain()
    }
}
