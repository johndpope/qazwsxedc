//
//  StartUpViewController.swift
//  YourCoin
//
//  Created by Juden on 2/26/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import JTMaterialSpinner

class StartUpViewController: UIViewController {
    let accountService: AccountService = AccountService()
    let accountStorage = UserDefaults.standard

    @IBOutlet weak var startupLoading: UIActivityIndicatorView!
    
    var spinnerView = JTMaterialSpinner()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(spinnerView)
        spinnerView.circleLayer.lineWidth = 2.0
//        spinnerView.circleLayer.strokeColor = UIColor(named:"BaseColorOne")?.cgColor
        spinnerView.circleLayer.strokeColor = UIColor.red.cgColor
        spinnerView.animationDuration = 2.5
        
        accountService.GetAccounts() {
            response, error in
            if let wallets = response?.count {
                //self.startupLoading.startAnimating()
                self.spinnerView.beginRefreshing()
                if wallets > 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000)) {
                        self.performSegue(withIdentifier: "startup_main", sender: self)
                        //self.startupLoading.stopAnimating()
                        self.spinnerView.endRefreshing()
                        
                    }
                    
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000)){
                        self.performSegue(withIdentifier: "startup_create", sender: self)
                        //self.startupLoading.stopAnimating()
                        self.spinnerView.endRefreshing()
                    }
                    
                }
            }
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
