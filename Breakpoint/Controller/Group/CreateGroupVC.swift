//
//  CreateGroupVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/14/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let resuseIdentifier = "CreateGroupCell"

class CreateGroupVC: UIViewController {
    // MARK: - Properties
    var emailArray = [String]()
    
    private var headerView = UIView.createHeaderView(withTitle: "_newgroup")
    private lazy var xButton = UIButton.createButton(withTitle: "", ofColor: .clear, backgroundColor: .clear, image: #imageLiteral(resourceName: "close"), vc: self, selector: #selector(xBtnClicked))
    
    private lazy var doneButton: UIButton = {
        let button = UIButton.createButton(withTitle: "DONE", ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), backgroundColor: .clear, vc: self, selector: #selector(doneBtnClicked))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .black)
        return button
    }()
    
    private let titleLabel = UILabel.createLabel(withText: "TITLE", ofSize: 10, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), ofAlignment: .center)
    private let titleTextField = UITextField.createTextField(withPlaceholderOf: "give your group a title")
    private let descriptionLabel = UILabel.createLabel(withText: "DESCRIPTION", ofSize: 10, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), ofAlignment: .center)
    private let descriptionTextField = UITextField.createTextField(withPlaceholderOf: "give your group a description")
    private let addEmailLabel = UILabel.createLabel(withText: "add people to your group", ofSize: 16, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), ofAlignment: .center)
    
    private let addEmailTextField: UITextField = {
        let tf = UITextField.createTextField(withPlaceholderOf: "enter an email...")
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return tf
    }()
    
    private let createGroupTable = UITableView.createBasicTableView(withCellClass: CreateGroupCell.self, reuseId: resuseIdentifier)
    
    private lazy var inputStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, titleTextField, descriptionLabel, descriptionTextField, addEmailLabel, addEmailTextField])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    private lazy var addGroupStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputStack, createGroupTable])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 30
        return stack
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        createGroupTable.delegate = self
        createGroupTable.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        headerView.addSubview(xButton)
        xButton.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        xButton.anchor(left: headerView.leftAnchor, paddingLeft: 25)
        
        headerView.addSubview(doneButton)
        doneButton.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        doneButton.anchor(right: headerView.rightAnchor, paddingRight: 25)
        
        view.addSubview(addGroupStack)
        addGroupStack.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingRight: 20, paddingBottom: 30, paddingLeft: 20)
        createGroupTable.setDimension(height: view.heightAnchor, heightMultiplier: 0.55)
        titleTextField.setDimension(height: addGroupStack.heightAnchor, heightMultiplier: 0.06)
        descriptionTextField.setDimension(height: addGroupStack.heightAnchor, heightMultiplier: 0.06)
        addEmailTextField.setDimension(height: addGroupStack.heightAnchor, heightMultiplier: 0.06)
    }
    
    // MARK: - Selectors
    @objc func xBtnClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneBtnClicked() {
        
    }
    
    @objc func textFieldDidChange() {
        if addEmailTextField.text == "" {
            emailArray = []
            createGroupTable.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: addEmailTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.createGroupTable.reloadData()
            }
        }
    }
}

// MARK: - UITableview delegate methods
extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier, for: indexPath) as! CreateGroupCell
        let image = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: image!, email: emailArray[indexPath.row], isSelected: false)
        return cell
    }
}

// MARK: - UITextFieldDelegate methods
extension CreateGroupVC: UITextFieldDelegate {
    
}
