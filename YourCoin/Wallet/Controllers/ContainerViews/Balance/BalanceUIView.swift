//
//  Balance.swift
//  YourCoin
//
//  Created by Some Man on 06.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import PureLayout

class BalanceUIView: UIView, ViewFragmet {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let acceptPayButton = UIButton()
    let payNowButton = UIButton()
    let historyStack = UIStackView()
    let historyLabel = UILabel()
    let progressStack = UIStackView()
    let inProgressLabel = UILabel()
    let colorProgressLabel = UILabel()
    let iconProgress = UIImageView(image: UIImage(named:"ProgressClock.png"))
    let balanceStack = UIStackView()
    let balanceLabel = UILabel()
    let nameCoin = UILabel()
    
    func SetupViews(){
        acceptPayButton.SetBaseCustomButtonStart()
        acceptPayButton.setTitle("ACCEPT PAY", for: UIControlState.normal )
        acceptPayButton.addTarget(self, action: #selector(AcceptPayAction), for: .touchUpInside)
        self.addSubview(acceptPayButton)
        
        payNowButton.SetInvisibleCustomButtonWallet()
        payNowButton.setTitle("PAY NOW", for: UIControlState.normal )
        payNowButton.addTarget(self, action: #selector(PayNowAction), for: .touchUpInside)
        self.addSubview(payNowButton)
        
        historyLabel.SetInfoCustomLabelWallet(text: "Transaction history", size: 16, color: UIColor.white)
        self.addSubview(historyLabel)
        
        historyStack.translatesAutoresizingMaskIntoConstraints = false
        historyStack.axis = .horizontal
        historyStack.distribution = .fill
        historyStack.spacing = 7
        historyStack.addArrangedSubview(historyLabel)
        historyStack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (GoToListHistory (_:))))
        self.addSubview(historyStack)
        
        inProgressLabel.SetInfoCustomLabelWallet(text: "IN PROGRESS", size: 16, color: UIColor.white)
        
        colorProgressLabel.SetInfoCustomLabelWallet(text: "14.88", size: 16, color: UIColor.cyan)
        
        progressStack.translatesAutoresizingMaskIntoConstraints = false
        progressStack.axis = .horizontal
        progressStack.distribution = .fill
        progressStack.spacing = 7
        progressStack.addArrangedSubview(iconProgress)
        progressStack.addArrangedSubview(inProgressLabel)
        progressStack.addArrangedSubview(colorProgressLabel)
        self.addSubview(progressStack)
        
        balanceLabel.SetInfoCustomLabelWallet(text: "1488.13", size: 50, color: UIColor.white)
        
        nameCoin.SetInfoCustomLabelWallet(text: "ETH", size: 14, color: UIColor.cyan)
        nameCoin.font = UIFont(name: "Roboto-Black", size: 14)
        
        balanceStack.translatesAutoresizingMaskIntoConstraints = false
        balanceStack.axis = .horizontal
        balanceStack.distribution = .fill
        balanceStack.spacing = 7
        balanceStack.addArrangedSubview(balanceLabel)
        balanceStack.addArrangedSubview(nameCoin)
        balanceStack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (GoToListWallets (_:))))
        self.addSubview(balanceStack)
    }
    
    @objc func PayNowAction(_ sender: UIButton) {
        print("->Pay Now")
    }
    
    @objc func AcceptPayAction(_ sender: UIButton) {
        print("->Accept Pay")
    }
    
    @objc func GoToListWallets(_ sender:UITapGestureRecognizer){
        print("->GoToListWallets") 
        
    }
    
    @objc func GoToListHistory(_ sender:UITapGestureRecognizer){
        print("->GoToListHistory")
        
    }
    
    func SetLayutConstrain(){
        acceptPayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        acceptPayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -95).isActive = true
        acceptPayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        acceptPayButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        payNowButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        payNowButton.bottomAnchor.constraint(equalTo: self.acceptPayButton.bottomAnchor, constant: -65).isActive = true
        payNowButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        payNowButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        historyStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        historyStack.bottomAnchor.constraint(equalTo: payNowButton.topAnchor, constant: -153).isActive = true
        
        iconProgress.heightAnchor.constraint(equalToConstant: 16).isActive = true
        iconProgress.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        progressStack.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: -23).isActive = true
        progressStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        balanceStack.bottomAnchor.constraint(equalTo: progressStack.topAnchor, constant: -23).isActive = true
        balanceStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
    }
}
