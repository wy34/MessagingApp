//
//  PostVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/12/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController {
    // MARK: - Properties
    private let headerView = UIView.createHeaderView(withTitle: "_postsomething")
    private lazy var xButton = UIButton.createButton(withTitle: "", ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), backgroundColor: .clear, image: #imageLiteral(resourceName: "close"), vc: self, selector: #selector(xBtnPressed))
    private let userImage = UIImageView.createImageView(withImage: #imageLiteral(resourceName: "defaultProfileImage"))
    private let userEmailLabel = UILabel.createLabel(withText: "user@breakpoint.com", ofSize: 20, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
    
    private lazy var messageInputField: UITextView = {
        let tv = UITextView()
        tv.text = "Say something here..."
        tv.textColor = #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1)
        tv.font = UIFont(name: "Menlo", size: 20)
        tv.backgroundColor = .clear
        return tv
    }()
    
    private lazy var sendButton = UIButton.createButton(withTitle: " SEND", ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), backgroundColor: #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1), image: #imageLiteral(resourceName: "send"), vc: self, selector: #selector(sendBtnPressed))
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        messageInputField.delegate = self
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        sendButton.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmailLabel.text = Auth.auth().currentUser?.email
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        headerView.addSubview(xButton)
        xButton.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        xButton.anchor(left: headerView.leftAnchor, paddingLeft: 25)
        
        view.addSubview(userImage)
        userImage.setDimension(height: view.widthAnchor, width: view.widthAnchor, heightMultiplier: 0.2, widthMultiplier: 0.2)
        userImage.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 15)
        
        view.addSubview(userEmailLabel)
        userEmailLabel.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, left: userImage.rightAnchor, paddingTop: 15, paddingRight: 15, paddingLeft: 15)
        userEmailLabel.setDimension(height: view.widthAnchor, heightMultiplier: 0.2)
        
        view.addSubview(messageInputField)
        messageInputField.setDimension(height: view.heightAnchor, heightMultiplier: 0.65)
        messageInputField.anchor(top: userEmailLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 20, paddingRight: 15, paddingLeft: 15)
        
        view.addSubview(sendButton)
        sendButton.anchor(top: messageInputField.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 20)
    }
    
    // MARK: - Selector
    @objc func xBtnPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func sendBtnPressed() {
        if messageInputField.text != nil && messageInputField.text != "Say something here..." {
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageInputField.text, forUID: Auth.auth().currentUser!.uid, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = false
                    print("Error posting message")
                }
            }
        }
    }
}

// MARK: - UITextView delegate methods
extension PostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        messageInputField.text = ""
    }
}
