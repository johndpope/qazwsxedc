//
//  CardViewController.swift
//  YourCoin
//
//  Created by Some Man on 24.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class WalletCardViewController: UIViewController {

    private var walletPublicKey:String?
    private var balance:String?
    private var priceToUSD:String?
    private var typeCoin:TypeCoin?
    
    private var infowallelUILabel = UILabel()
    private var infocurrencyUILabel = UILabel()
    private var wallelUILabel = UILabel()
    private var vauleCurrencyUILabel = UILabel()
    private var typeCoinCurrencyUILabel = UILabel()
    private var typeCoinUILabel = UILabel()
    private var backIconUIImage = UIImageView()
    private var coinIconUIImage = UIImageView()
    private var coinName = UILabel()
    
    public func SetValueCard(walletPublicKey:String, balance:String, priceToUSD:String, typeCoin:TypeCoin ) ->UIViewController
    {
        self.walletPublicKey = walletPublicKey
        self.balance = balance
        self.priceToUSD = priceToUSD
        self.typeCoin = typeCoin
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.16, blue: 0.21, alpha: 1)
        self.view.layer.cornerRadius = 10
        self.view.layer.borderWidth = 0;
      
        backIconUIImage.image = #imageLiteral(resourceName: "BackgroundCircle")
        self.view.addSubview(backIconUIImage)
        backIconUIImage.translatesAutoresizingMaskIntoConstraints = false
        backIconUIImage.heightAnchor.constraint(equalToConstant: 91).isActive = true
        backIconUIImage.widthAnchor.constraint(equalToConstant: 91).isActive = true
        backIconUIImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 13).isActive = true
        backIconUIImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 9).isActive = true
        
        infowallelUILabel = SetCustomLabel(text:"WALLET:", style: "Roboto-Light")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -11).isActive = true
        
        infocurrencyUILabel = SetCustomLabel(text:"Quantity:", style: "Roboto-Light")
        self.view.addSubview(infocurrencyUILabel)
        infocurrencyUILabel.leftAnchor.constraint(equalTo: self.backIconUIImage.rightAnchor, constant: 38).isActive = true
        infocurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true

        infowallelUILabel = SetCustomLabel(text:"VALUE:", style: "Roboto-Light")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.backIconUIImage.rightAnchor, constant: 38).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true
        
        //////
        
        coinName = SetCustomLabel(text: (typeCoin?.GetType().name)!, style:"Roboto-Bold")
        self.view.addSubview(coinName)
        coinName.leftAnchor.constraint(equalTo: self.backIconUIImage.rightAnchor, constant: 38).isActive = true
        coinName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 13).isActive = true
        coinName.widthAnchor.constraint(equalToConstant: 209).isActive = true
        
        coinIconUIImage.image = typeCoin?.GetType().icon
        self.view.addSubview(coinIconUIImage)
        coinIconUIImage.translatesAutoresizingMaskIntoConstraints = false
        coinIconUIImage.heightAnchor.constraint(equalToConstant: 47).isActive = true
        coinIconUIImage.widthAnchor.constraint(equalToConstant: 47).isActive = true
        coinIconUIImage.centerXAnchor.constraint(equalTo: self.backIconUIImage.centerXAnchor).isActive = true
        coinIconUIImage.centerYAnchor.constraint(equalTo: self.backIconUIImage.centerYAnchor).isActive = true

        wallelUILabel = SetCustomLabel(text: walletPublicKey!, style:"Roboto-Bold")
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 99).isActive = true
        wallelUILabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -12).isActive = true
        wallelUILabel.widthAnchor.constraint(equalToConstant: 209).isActive = true

        vauleCurrencyUILabel = SetCustomLabel(text:balance!, style:"Roboto-Bold")
        self.view.addSubview(vauleCurrencyUILabel)
        vauleCurrencyUILabel.leftAnchor.constraint(equalTo: self.infocurrencyUILabel.rightAnchor, constant: 7).isActive = true
        vauleCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true

        wallelUILabel = SetCustomLabel(text:priceToUSD!, style:"Roboto-Bold")
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.infowallelUILabel.rightAnchor, constant: 7).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true

        //////r
        typeCoinCurrencyUILabel = SetCustomLabel(text:(typeCoin?.GetType().reduction)!, style:"Roboto-Black")
        self.view.addSubview(typeCoinCurrencyUILabel)
        typeCoinCurrencyUILabel.leftAnchor.constraint(equalTo: vauleCurrencyUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true

        typeCoinUILabel = SetCustomLabel(text:"USD", style:"Roboto-Black")
        self.view.addSubview(typeCoinUILabel)
        typeCoinUILabel.leftAnchor.constraint(equalTo: wallelUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    private func SetCustomLabel(text:String, style:String) -> UILabel {
        let some = UILabel()
        some.text = text
        some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        some.font = UIFont(name: style, size: 16)
        some.font = some.font.withSize(16)
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
}

