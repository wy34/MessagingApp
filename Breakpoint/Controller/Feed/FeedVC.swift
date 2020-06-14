//
//  FirstViewController.swift
//  Breakpoint
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FeedCellIdentifier"

class FeedVC: UIViewController {
    // MARK: - Properties
    var messageArray = [Message]()
    private let headerView = UIView.createHeaderView(withTitle: "_feed")
    private lazy var composeBtn = UIButton.createButton(withTitle: "", backgroundColor: .clear, image: #imageLiteral(resourceName: "compose"), vc: self, selector: #selector(composeBtnPressed))
    private let feedTable = UITableView.createBasicTableView(withCellClass: FeedCell.self, reuseId: reuseIdentifier)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        feedTable.delegate = self
        feedTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { returnedMessageArray in
            self.messageArray = returnedMessageArray.reversed()
            self.feedTable.reloadData()
        }
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        headerView.addSubview(composeBtn)
        composeBtn.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        composeBtn.anchor(right: headerView.rightAnchor, paddingRight: 25)
        
        view.addSubview(feedTable)
        feedTable.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
    
    // MARK: - Selectors
    @objc func composeBtnPressed() {
        let vcToGoTo = PostVC()
        vcToGoTo.modalPresentationStyle = .fullScreen
        present(vcToGoTo, animated: true)
    }
}

// MARK: - UITableView delegate methods
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        return cell
    }
}
