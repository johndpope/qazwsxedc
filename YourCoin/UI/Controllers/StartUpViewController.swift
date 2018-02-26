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
        
        // TODO: Refactor thit spinner's initialization
        self.view.addSubview(spinnerView)
        spinnerView.frame = CGRect(x: (375.0 - 50.0) / 2.0, y: 300, width: 50, height: 50)
        spinnerView.circleLayer.lineWidth = 2.0
        spinnerView.circleLayer.strokeColor = UIColor(named:"BaseColorOne")?.cgColor
        spinnerView.animationDuration = 2.5
        
        accountService.GetAccounts() {
            response, error in
            if let wallets = response?.count {
                if wallets > 0 {
                    self.spinnerView.beginRefreshing()
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                        self.performSegue(withIdentifier: "startup_main", sender: self)
                        self.spinnerView.endRefreshing()
                        
                    }
                    
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){
                        self.performSegue(withIdentifier: "startup_create", sender: self)
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
