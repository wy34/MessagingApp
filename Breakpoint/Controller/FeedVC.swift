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
    private let headerView = UIView.createHeaderView(withTitle: "_feed")
    private lazy var composeBtn = UIButton.createButton(withTitle: "", backgroundColor: .clear, image: #imageLiteral(resourceName: "compose"), vc: self, selector: #selector(composeBtnPressed))
    private let feedTable = UITableView.createBasicTableView(withReuseId: reuseIdentifier)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        feedTable.delegate = self
        feedTable.dataSource = self
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
    
    }
}

// MARK: - UITableView delegate methods
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
