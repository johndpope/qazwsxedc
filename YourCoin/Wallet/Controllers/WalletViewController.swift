//
//  WalletViewController.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 21.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit



class WalletViewController: UIViewController {

    let containerView = UIView()

    lazy var balanceUIView: BalanceUIView = {
        let vc = BalanceUIView()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var exchangeRatesViewController: ExchangeRatesViewController = {
        let vc = ExchangeRatesViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    let settingsButton = UIButton()
    let balanceSwichButton = UIButton()
    let exchangeRatesSwitchButton = UIButton()
    let defaultRectangleImageView = UIImageView(image: UIImage(named: "DefaultRectangle.png"))
    let cyanRectangleImageView = UIImageView(image: UIImage(named: "CyanRectangle.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupViews()
        SetLayutConstrain()
        balanceUIView.view.isHidden = false
    }
    
    func SetupViews(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        
        settingsButton.SetSettingsCustomButtonWallet()
        self.view.addSubview(settingsButton)
        
        defaultRectangleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(defaultRectangleImageView)
        cyanRectangleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cyanRectangleImageView)

        
        balanceSwichButton.SetSwitchCustomButtonWallet()
        balanceSwichButton.setTitle("Balance", for: .normal)
        balanceSwichButton.setTitleColor(UIColor.cyan, for: .normal)
        balanceSwichButton.addTarget(self, action: #selector(SwitchButtonAction), for: .touchUpInside)
        self.view.addSubview(balanceSwichButton)
        
        exchangeRatesSwitchButton.SetSwitchCustomButtonWallet()
        exchangeRatesSwitchButton.setTitle("Exchange Rates", for: .normal)
        exchangeRatesSwitchButton.addTarget(self, action: #selector(SwitchButtonAction), for: .touchUpInside)
        self.view.addSubview(exchangeRatesSwitchButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = self.view.frame
        childVC.didMove(toParentViewController: self)
    }
    
    private func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParentViewController: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()
    }
    
    @objc func SwitchButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Balance"{
            balanceSwichButton.setTitleColor(UIColor.cyan, for: .normal)
            exchangeRatesSwitchButton.setTitleColor(UIColor.white, for: .normal)
            exchangeRatesViewController.view.isHidden = true
            balanceUIView.view.isHidden = false
        }
        else if sender.titleLabel?.text == "Exchange Rates"{
            balanceSwichButton.setTitleColor(UIColor.white, for: .normal)
            exchangeRatesSwitchButton.setTitleColor(UIColor.cyan, for: .normal)
            exchangeRatesViewController.view.isHidden = false
            balanceUIView.view.isHidden = true
        }
        else{
            print("Error")
        }
    }
    
    private func SetLayutConstrain(){
        
        defaultRectangleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        defaultRectangleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 69).isActive = true
        
        cyanRectangleImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cyanRectangleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 69).isActive = true
        
        settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18).isActive = true
        settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 34).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        balanceSwichButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 78).isActive = true
        balanceSwichButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        balanceSwichButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        exchangeRatesSwitchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 78).isActive = true
        exchangeRatesSwitchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        exchangeRatesSwitchButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
    }

}
