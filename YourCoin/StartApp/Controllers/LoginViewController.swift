//
//  LoginViewController.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 17.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//

import UIKit

extension UIButton : CoinButton {
    func SetBaseCustomButton() -> Void {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0;
        self.backgroundColor = UIColor.cyan
        self.setTitleColor(UIColor.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    func SetSecondCustomButton(){
        self.backgroundColor = .clear
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField {
    func SetCustomTextField(placeholder:String) -> Void{
        self.backgroundColor = .clear
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 3;
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.layer.borderColor = UIColor.cyan.cgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor : UIColor.darkGray])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let loginbutton = UIButton()
    let newAccountButton:UIButton = UIButton()
    let forgotPassword:UIButton = UIButton()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let logoImageView = UIImageView(image: UIImage(named: "Logo.png"))
    let RectangleImageView = UIImageView(image: UIImage(named: "Rectangle.png"))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginbutton.SetBaseCustomButton()
        loginbutton.setTitle("GO!", for: UIControlState.normal)
        self.view.addSubview(loginbutton)
        
        newAccountButton.SetSecondCustomButton()
        newAccountButton.setTitle("CREATE NEW ACCOUNT", for: UIControlState.normal )
        self.view.addSubview(newAccountButton)
        
        forgotPassword.SetSecondCustomButton()
        forgotPassword.setTitle("FORGOT PASSWORD?", for: UIControlState.normal )
        self.view.addSubview(forgotPassword)
        
        loginTextField.SetCustomTextField(placeholder: "USER NAME")
        self.view.addSubview(loginTextField)
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.SetCustomTextField(placeholder: "PASSWORD")
        self.view.addSubview(passwordTextField)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)
        RectangleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(RectangleImageView)
        
        SetLayutConstrain()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = 0
            }

    }
 
    
    private func SetLayutConstrain(){
        loginbutton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95).isActive = true
        loginbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginbutton.widthAnchor.constraint(equalToConstant: 300).isActive = true

        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: self.loginbutton.bottomAnchor, constant: -65).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: -65).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 117).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 118).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 148).isActive = true
        
        RectangleImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        RectangleImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -25).isActive = true
        RectangleImageView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        RectangleImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        newAccountButton.rightAnchor.constraint(equalTo: self.RectangleImageView.rightAnchor, constant: -5)  .isActive = true
        newAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        newAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        newAccountButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        forgotPassword.leftAnchor.constraint(equalTo: self.RectangleImageView.leftAnchor, constant: -5)  .isActive = true
        forgotPassword.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        forgotPassword.heightAnchor.constraint(equalToConstant: 45).isActive = true
        forgotPassword.widthAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
   
}
