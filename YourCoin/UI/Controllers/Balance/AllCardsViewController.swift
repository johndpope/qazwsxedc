//
//  AllCardsViewController.swift
//  YourCoin
//
//  Created by Some Man on 22.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class AllCardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var i:Int = 1;
    @IBAction func ыы(_ sender: Any) {
        i+=1
        print("Swiper", String(i))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
