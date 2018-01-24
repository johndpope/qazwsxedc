//
//  CardViewController.swift
//  YourCoin
//
//  Created by Some Man on 24.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class WalletCardViewController: UIViewController {

    var infowallelUILabel = UILabel()
    var infocurrencyUILabel = UILabel()
    var wallelUILabel = UILabel()
    var vauleCurrencyUILabel = UILabel()
    var typeCoinCurrencyUILabel = UILabel()
    var typeCoinUILabel = UILabel()
    
    var walletCardObject:WalletCardObject? = WalletCardObject(Wallet:"-----", Balance:0, PriceToUSD:0, TypeCoin:"--")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.16, blue: 0.21, alpha: 1)
        self.view.layer.cornerRadius = 10
        self.view.layer.borderWidth = 0;
        
        infowallelUILabel = SetLabelInfo(text:"WALLET:")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 27).isActive = true
        
        infocurrencyUILabel = SetLabelInfo(text:"CURRENCY:")
        self.view.addSubview(infocurrencyUILabel)
        infocurrencyUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infocurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        infowallelUILabel = SetLabelInfo(text:"VALUE:")
        self.view.addSubview(infowallelUILabel)
        infowallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 22).isActive = true
        infowallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true
        
        //////
        
        wallelUILabel = SetLabelValue(text: (walletCardObject?.walletPublicKey)!)
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 99).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 27).isActive = true
        wallelUILabel.widthAnchor.constraint(equalToConstant: 209).isActive = true
        
        vauleCurrencyUILabel = SetLabelValue(text:String(describing: (walletCardObject?.balance)!))
        self.view.addSubview(vauleCurrencyUILabel)
        vauleCurrencyUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 122).isActive = true
        vauleCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        wallelUILabel = SetLabelValue(text:String((walletCardObject?.balance)!*(walletCardObject?.priceToUSD)!))
        self.view.addSubview(wallelUILabel)
        wallelUILabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 84).isActive = true
        wallelUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true
        
        //////
        
        typeCoinCurrencyUILabel = SetLabelNameValue(text:(walletCardObject?.typeCoin)!)
        self.view.addSubview(typeCoinCurrencyUILabel)
        typeCoinCurrencyUILabel.leftAnchor.constraint(equalTo: vauleCurrencyUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinCurrencyUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58).isActive = true
        
        typeCoinUILabel = SetLabelNameValue(text:"USD")
        self.view.addSubview(typeCoinUILabel)
        typeCoinUILabel.leftAnchor.constraint(equalTo: wallelUILabel.rightAnchor, constant: 10).isActive = true
        typeCoinUILabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 89).isActive = true

    }
    
    public func SetCardsView(CardInfo:WalletCardObject){
         self.walletCardObject = CardInfo//WalletCardObject(Wallet:"-----", Balance:13, PriceToUSD:29, TypeCoin:"ETH")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


 

    private func SetLabelInfo(text:String) -> UILabel {
        let some = UILabel()
        some.text = text
        some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        some.font = UIFont(name: "Roboto-Light", size: 16)
        some.font = some.font.withSize(16)
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
    
    private func SetLabelValue(text:String) -> UILabel {
        let some = UILabel()
        some.text = text
        some.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        some.font = UIFont(name: "Roboto-Bold", size: 16)
        some.font = some.font.withSize(16)
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
    
    private func SetLabelNameValue(text:String) -> UILabel {
        let some = UILabel()
        some.text = text
        some.textColor = UIColor(red: 0.43, green: 0.92, blue: 0.89, alpha: 1)
        some.font = UIFont(name: "Roboto-Black", size: 16)
        some.font = some.font.withSize(16)
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
}

