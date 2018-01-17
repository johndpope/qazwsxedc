//
//  BalanceUIView.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 28.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit

class BalanceUIViewController:  UIViewController {
    
   // var balanceUIView = BalanceUIView()

    override func viewDidLoad() {
        super.viewDidLoad()
      // SetUIView(viewFragmet: balanceUIView)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func SetUIView(viewFragmet:UIView)
    {
        if self.view.subviews.count != 0 {
            self.view.subviews[self.view.subviews.count-1].removeFromSuperview()
        }
        let some:ViewFragmet = viewFragmet as! ViewFragmet
        print(self.view.subviews.count)
        self.view.addSubview(some as! UIView)
        //self.view = some as! UIView
        (some as! UIView).autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        some.SetupViews()
        some.SetLayutConstrain()
        print(self.view.subviews.count)
    }
    

}
