//
//  WalletViewController.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 21.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit



class WalletViewController: UIViewController {

    let settingsButton = UIButton()
    let balanceSwichButton = UIButton()
    let exchangeRatesSwitchButton = UIButton()
    let defaultRectangleImageView = UIImageView(image: UIImage(named: "DefaultRectangle.png"))
    let cyanRectangleImageView = UIImageView(image: UIImage(named: "CyanRectangle.png"))
    
    
    let Balance = BalanceUIView()
    let chartUIView = ChartUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupViews()
        SetLayutConstrain()
        generalBalanceUIView.SetUIView(viewFragmet:Balance)
        generalExchangeRatesView.SetUIView(viewFragmet: chartUIView)
        generalExchangeRatesView.view.isHidden = true
        generalBalanceUIView.view.isHidden = false

        
    }
    
    func SetupViews(){
        self.view.addSubview(generalBalanceUIView.view)
        self.view.addSubview(generalExchangeRatesView.view)
        
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
    
    @objc func SwitchButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Balance"{
            balanceSwichButton.setTitleColor(UIColor.cyan, for: .normal)
            exchangeRatesSwitchButton.setTitleColor(UIColor.white, for: .normal)
            generalExchangeRatesView.view.isHidden = true
           generalBalanceUIView.view.isHidden = false
        }
        else if sender.titleLabel?.text == "Exchange Rates"{
            balanceSwichButton.setTitleColor(UIColor.white, for: .normal)
            exchangeRatesSwitchButton.setTitleColor(UIColor.cyan, for: .normal)
            generalExchangeRatesView.view.isHidden = false
            generalBalanceUIView.view.isHidden = true
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
