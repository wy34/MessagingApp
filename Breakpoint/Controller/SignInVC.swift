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
    private let xButton = UIButton.createButton(withTitle: "", ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), backgroundColorOf: .clear, imageOf: #imageLiteral(resourceName: "close"))
    private let signInTitleLabel = UILabel.createLabel(withText: "email sign in", ofSize: 18, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), ofAlignment: .center)
    private let emailTextField = UITextField.createTextField(withPlaceholderOf: "email")
    private let passwordTextField = UITextField.createTextField(withPlaceholderOf: "password")
    private let signInButton = UIButton.createButton(withTitle: "SIGN IN", ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), backgroundColorOf: .clear)
    
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
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        anchorElements()
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(xButton)
        xButton.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.05, widthMultiplier: 0.1)
        xButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft:  20)
        
        view.addSubview(signInStack)
        signInStack.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.3, widthMultiplier: 0.85)
        signInStack.anchor(top: xButton.bottomAnchor, paddingTop: 10)
        signInStack.center(x: view.centerXAnchor)
    }
}
