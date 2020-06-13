//
//  signInVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    // MARK: - Properties
    private lazy var xButton = UIButton.createButton(withTitle: "", ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), backgroundColor: .clear, image: #imageLiteral(resourceName: "close"), vc: self, selector: #selector(xBtnPressed))
    private let signInTitleLabel = UILabel.createLabel(withText: "email sign in", ofSize: 20, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), ofAlignment: .center)
    private let emailTextField = UITextField.createTextField(withPlaceholderOf: "email")
    private let passwordTextField = UITextField.createTextField(withPlaceholderOf: "password")
    private lazy var signInButton = UIButton.createButton(withTitle: "SIGN IN", ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), backgroundColor: .clear, vc: self, selector: #selector(signInBtnPressed))

    private lazy var signInStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signInTitleLabel, emailTextField, passwordTextField, signInButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        anchorElements()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(xButton)
        xButton.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.05, widthMultiplier: 0.1)
        xButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft:  15)
        
        view.addSubview(signInStack)
        signInStack.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.3, widthMultiplier: 0.85)
        signInStack.anchor(top: xButton.bottomAnchor, paddingTop: 10)
        signInStack.centerWithConstant(x: view.centerXAnchor)
    }
    
    // MARK: - Selector
    @objc func xBtnPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func signInBtnPressed() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                debugPrint(error?.localizedDescription)
            }
        }
        
//        AuthService.instance.registerUser(withEmail: email, andPassword: password) { (success, error) in
//            if success {
//                self.dismiss(animated: true, completion: nil)
//            } else {
//                print("Error registering from sign in")
//            }
//        }
    }
}

// MARK: - UITextfield delegate methods
extension SignInVC: UITextFieldDelegate {
    
}
