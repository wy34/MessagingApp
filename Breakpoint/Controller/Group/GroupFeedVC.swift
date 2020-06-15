//
//  GroupMessagingVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/15/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroupMessageCell"

class GroupFeedVC: UIViewController {
    // MARK: - Properties
    private let headerView = UIView.createHeaderView(withTitle: "_grouptitle")
    private lazy var backButton = UIButton.createButton(withTitle: "", backgroundColor: .clear, image: #imageLiteral(resourceName: "backIcon"), vc: self, selector: #selector(backBtnPressed))
    private let memberList = UILabel.createLabel(withText: "Label", ofSize: 14, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1))
    private let messageTable = UITableView.createBasicTableView(withCellClass: GroupFeedCell.self, reuseId: reuseIdentifier)
    private let searchTextField = UITextField.createTextField(withPlaceholderOf: "Placeholder")
    private lazy var sendButton = UIButton.createButton(withTitle: "", ofColor: .clear, backgroundColor: .clear, image: #imageLiteral(resourceName: "send"), vc: self, selector: #selector(sendPressed))
    
    private var sendBtnView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        messageTable.delegate = self
        messageTable.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        sendBtnView.bindToKeyboard()
        //memberList.backgroundColor = .red
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        view.addSubview(memberList)
        memberList.setDimension(height: view.heightAnchor, heightMultiplier: 0.07)
        memberList.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingRight: 15, paddingLeft: 15)
        
        headerView.addSubview(backButton)
        backButton.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        backButton.anchor(left: headerView.leftAnchor, paddingLeft: 25)
        
        view.addSubview(messageTable)
        messageTable.setDimension(height: view.heightAnchor, heightMultiplier: 0.75)
        messageTable.anchor(top: memberList.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        view.addSubview(sendBtnView)
        sendBtnView.anchor(top: messageTable.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
        
        sendBtnView.addSubview(searchTextField)
        searchTextField.setDimension(height: sendBtnView.widthAnchor, width: sendBtnView.widthAnchor, heightMultiplier: 0.09, widthMultiplier: 0.78)
        searchTextField.anchor(left: sendBtnView.leftAnchor, paddingLeft: 15)
        searchTextField.centerWithConstant(y: sendBtnView.centerYAnchor)
        
        sendBtnView.addSubview(sendButton)
        sendButton.setDimension(height: sendBtnView.widthAnchor, width: sendBtnView.widthAnchor, heightMultiplier: 0.09, widthMultiplier: 0.09)
        sendButton.anchor(right: sendBtnView.rightAnchor, paddingRight: 15)
        sendButton.centerWithConstant(y: sendBtnView.centerYAnchor)
    }
    
    // MARK: - Selectors
    @objc func backBtnPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func sendPressed() {
        
    }
}

// MARK: - UITableView delegate methods
extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
        return cell
    }
}
