//
//  StartUpViewController.swift
//  YourCoin
//
//  Created by Juden on 2/26/18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {
    let accountService: AccountService = AccountService()
    let accountStorage = UserDefaults.standard

    @IBOutlet weak var startupLoading: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator(isLoading: true)
        accountService.GetAccounts() {
            response, error in
            if let wallets = response?.count {
                if wallets > 0 {
                    DispatchQueue.main.async {
                        self.showIndicator(isLoading: false)
                        self.performSegue(withIdentifier: "startup_main", sender: self)
                        
                    }
                    
                }
                else {
                    DispatchQueue.main.async {
                        self.showIndicator(isLoading: false)
                        self.performSegue(withIdentifier: "startup_create", sender: self)
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
    
    func showIndicator(isLoading: Bool) {
        if isLoading {
            startupLoading.center = self.view.center
            startupLoading.hidesWhenStopped = true
            startupLoading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(startupLoading)
        }
        else {
            startupLoading.stopAnimating()
            
        }
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
