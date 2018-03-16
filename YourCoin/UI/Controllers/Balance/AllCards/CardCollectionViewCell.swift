//
//  CardCollectionViewCell.swift
//  YourCoin
//
//  Created by Some Man on 22.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UIViewController {
   
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
    }

    @IBAction func RightSwipeAction(_ sender: UISwipeGestureRecognizer) {

        print("Right Swipe")
    }
    
    @IBAction func LeftSwipeAction(_ sender: UISwipeGestureRecognizer) {

        print("Left Swipe")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
