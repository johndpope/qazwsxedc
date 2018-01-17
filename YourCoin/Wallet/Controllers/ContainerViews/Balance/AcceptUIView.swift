//
//  AcceptUIView.swift
//  YourCoin
//
//  Created by Some Man on 16.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit

class AcceptUIView: UIView, ViewFragmet {
    
    let imageQRcode = UIImageView()
    let shareButton = UIButton()
    let copyButton = UIButton()
    let publicKey = UILabel()
    let backButton = UIButton()
    
    func SetupViews() {
        shareButton.SetBaseCustomButtonStart()
        shareButton.setTitle("SHARE NOW", for: UIControlState.normal )
        shareButton.addTarget(self, action: #selector(ShareKeyAction), for: .touchUpInside)
        self.addSubview(shareButton)
        
        copyButton.SetInvisibleCustomButtonWallet()
        copyButton.setTitle("COPY KEY", for: UIControlState.normal )
        copyButton.addTarget(self, action: #selector(CopyKeyAction), for: .touchUpInside)
        self.addSubview(copyButton)
        
        backButton.SetCustomBackButton()
        self.addSubview(backButton)
    }
    
    @objc func CopyKeyAction(_ sender: UIButton){
        print("->copy key")
        UIPasteboard.general.string = "test"
    }
    
    @objc func ShareKeyAction(_ sender: UIButton){
        print("->copy key")
    }
    
    func SetLayutConstrain() {
        shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -95).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        copyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        copyButton.bottomAnchor.constraint(equalTo: self.shareButton.bottomAnchor, constant: -65).isActive = true
        copyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        copyButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        backButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: self.copyButton.bottomAnchor, constant: -65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }

}
