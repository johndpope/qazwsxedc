//
//  CreateAccountViewController.swift
//  YourCoin
//
//  Created by Dmitriy Zaretskiy on 21.12.17.
//  Copyright © 2017 Bubble. All rights reserved.
//
import UIKit


class CreateAccountViewController: UIViewController, UITextFieldDelegate{
    
    let loginbutton = UIButton()
    let newAccountButton:UIButton = UIButton()
    let forgotPassword:UIButton = UIButton()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let logoImageView = UIImageView(image: UIImage(named: "Logo.png"))
    let RectangleImageView = UIImageView(image: UIImage(named: "Rectangle.png"))
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor(patternImage: UIImage(named:"BaseBackround.png")!)
        SetupViews()
        SetLayutConstrain()
    }
        
        func SetupViews(){
        loginbutton.SetBaseCustomButtonStart()
        loginbutton.setTitle("GO!", for: UIControlState.normal)
        loginbutton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(loginbutton)
        
        newAccountButton.SetSecondCustomButtonStart()
        newAccountButton.setTitle("CREATE NEW ACCOUNT", for: UIControlState.normal )
        self.view.addSubview(newAccountButton)
        
        forgotPassword.SetSecondCustomButtonStart()
        forgotPassword.setTitle("FORGOT PASSWORD?", for: UIControlState.normal )
        self.view.addSubview(forgotPassword)
        
        loginTextField.SetCustomTextFieldStart(placeholder: "NEW USER NAME")
        self.view.addSubview(loginTextField)
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.SetCustomTextFieldStart(placeholder: "NEW PASSWORD")
        self.view.addSubview(passwordTextField)
        
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.SetCustomTextFieldStart(placeholder: "CONFIRM PASSWORD")
        self.view.addSubview(confirmPasswordTextField)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)
        RectangleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(RectangleImageView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
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
        passwordTextField.bottomAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor, constant: -65).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        confirmPasswordTextField.bottomAnchor.constraint(equalTo: self.loginbutton.bottomAnchor, constant: -65).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: -65).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 117).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 118).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 148).isActive = true
        
       
        
    }
    
    
}

