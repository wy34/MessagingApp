//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroupCellIdentifier"

class GroupsVC: UIViewController {
    // MARK: - Properties
    var groupsArray = [Group]()
    private let headerView = UIView.createHeaderView(withTitle: "_groups")
    private lazy var addGroupBtn = UIButton.createButton(withTitle: "", backgroundColor: .clear, image: #imageLiteral(resourceName: "addNewIcon"), vc: self, selector: #selector(addBtnPressed))
    private let groupTable = UITableView.createBasicTableView(withCellClass: GroupVCCell.self, reuseId: reuseIdentifier)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        groupTable.delegate = self
        groupTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupTable.reloadData()
            }
        }
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        headerView.addSubview(addGroupBtn)
        addGroupBtn.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        addGroupBtn.anchor(right: headerView.rightAnchor, paddingRight: 25)
        
        view.addSubview(groupTable)
        groupTable.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
    
    // MARK: - Selector
    @objc func addBtnPressed() {
        let vcToGoTo = CreateGroupVC()
        vcToGoTo.modalPresentationStyle = .fullScreen
        present(vcToGoTo, animated: true)
    }
}

// MARK: - UITableview delegate methods
extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GroupVCCell
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDescription, memberCount: group.memberCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcToGoTo = GroupFeedVC()
        vcToGoTo.modalPresentationStyle = .fullScreen
        present(vcToGoTo, animated: true)
    }
}
