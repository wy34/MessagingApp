//
//  LoginVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    // MARK: - Properties
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "loginBGImage")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let titleLabel = UILabel.createLabel(withText: "_breakpoint", ofSize: 25, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1))
    
    private let loginOptionsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        view.layer.shadowOpacity = 0.75
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    private let loginLabel = UILabel.createLabel(withText: "_login", ofSize: 18, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), ofAlignment: .center)
    private let fbLoginBtn = UIButton.createButton(withTitle: "LOGIN WITH FB", backgroundColorOf: #colorLiteral(red: 0.262745098, green: 0.3568627451, blue: 0.568627451, alpha: 1))
    private let gglLoginBtn = UIButton.createButton(withTitle: "LOGIN WITH G+", backgroundColorOf: #colorLiteral(red: 0.8078431373, green: 0.3294117647, blue: 0.2392156863, alpha: 1))
    private let orLabel = UILabel.createLabel(withText: "OR", ofSize: 18, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), ofAlignment: .center)
    
    private let emailLoginBtn: UIButton = {
        let button = UIButton.createButton(withTitle: " by email", backgroundColorOf: .clear, imageOf: #imageLiteral(resourceName: "emailIcon"))
        button.addTarget(self, action: #selector(emailLoginBtnPressed), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginLabel, fbLoginBtn, gglLoginBtn, orLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        anchorElements()
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(backgroundImageView)
        backgroundImageView.setDimension(height: view.heightAnchor, heightMultiplier: 0.5)
        backgroundImageView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 25)
        titleLabel.center(x: view.centerXAnchor)
        
        view.addSubview(loginOptionsContainer)
        loginOptionsContainer.setDimension(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.55, widthMultiplier: 0.95)
        loginOptionsContainer.center(x: view.centerXAnchor, y: view.centerYAnchor)
        
        loginOptionsContainer.addSubview(emailLoginBtn)
        emailLoginBtn.anchor(bottom: loginOptionsContainer.bottomAnchor, paddingBottom: 15)
        emailLoginBtn.center(x: loginOptionsContainer.centerXAnchor, y: loginOptionsContainer.centerYAnchor)
        emailLoginBtn.setDimension(height: loginOptionsContainer.heightAnchor, heightMultiplier: 0.1)
        
        loginOptionsContainer.addSubview(loginStack)
        loginStack.anchor(top: loginOptionsContainer.topAnchor, bottom: emailLoginBtn.topAnchor, paddingTop: 15, paddingBottom: -4)
        loginStack.center(x: loginOptionsContainer.centerXAnchor)
        loginStack.setDimension(width: loginOptionsContainer.widthAnchor, widthMultiplier: 0.85)
    }
    
    // MARK: - Selector
    @objc func emailLoginBtnPressed() {
        let vcToGoTo = SignInVC()
        vcToGoTo.modalPresentationStyle = .fullScreen
        present(vcToGoTo, animated: true)
    }
}
