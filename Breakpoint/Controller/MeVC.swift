//
//  MeVC.swift
//  Breakpoint
//
//  Created by William Yeung on 6/12/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "MeCellIdentifier"

class MeVC: UIViewController {
    // MARK: - Properties
    private let headerView = UIView.createHeaderView(withTitle: "_me")
    private lazy var logOutBtn = UIButton.createButton(withTitle: "", backgroundColor: .clear, image: #imageLiteral(resourceName: "logoutIcon"), vc: self, selector: #selector(logOutPressed))
    
    private let profileContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        return view
    }()
    
    private let profileImageView = UIImageView.createImageView(withImage: #imageLiteral(resourceName: "defaultProfileImage"))
    private let emailLabel = UILabel.createLabel(withText: "user@breakpoint.com", ofSize: 20, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1), ofAlignment: .center)
    private let meTable = UITableView.createBasicTableView(reuseId: reuseIdentifier)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorElements()
        meTable.delegate = self
        meTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }
    
    // MARK: - Helper
    func anchorElements() {
        view.addSubview(headerView)
        headerView.setDimension(height: view.heightAnchor, heightMultiplier: 0.1)
        headerView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        headerView.addSubview(logOutBtn)
        logOutBtn.centerWithConstant(y: headerView.centerYAnchor, yPadding: 10)
        logOutBtn.anchor(right: headerView.rightAnchor, paddingRight: 25)
        
        view.addSubview(profileContainer)
        profileContainer.setDimension(height: view.heightAnchor, heightMultiplier: 0.45)
        profileContainer.anchor(top: headerView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor)
        
        profileContainer.addSubview(profileImageView)
        profileImageView.centerX(to: profileContainer, withMultiplierOf: 1)
        NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: profileContainer, attribute: .centerY, multiplier: 0.48, constant: 0).isActive = true
       
        profileContainer.addSubview(emailLabel)
        emailLabel.centerWithConstant(x: profileContainer.centerXAnchor)
        emailLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 15)
        
        view.addSubview(meTable)
        meTable.anchor(top: profileContainer.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor)
    }
    
    // MARK: - Selector
    @objc func logOutPressed() {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let vc = SignUpVC()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true)
    }
}

// MARK: - UITableview delegate methods
extension MeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}

