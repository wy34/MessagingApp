//
//  TabBarController.swift
//  Breakpoint
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit
import Firebase

class RootTabBarController: UIViewController {
    // MARK: - Properties
    private let tabBar: UITabBarController = {
        let tb = UITabBarController()
        
        let firstVC = FeedVC()
        firstVC.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "feed-tabIcon"), tag: 0)
        
        let secondVC = GroupsVC()
        secondVC.tabBarItem = UITabBarItem(title: "Groups", image: #imageLiteral(resourceName: "groups-tabIcon"), tag: 1)
        
        tb.viewControllers = [firstVC, secondVC]
        tb.tabBar.barTintColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        tb.tabBar.tintColor = #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1)
        return tb
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        displayAppropriateInitialVC()
    }
    
    // MARK: - Helper
    func configureUI() {
        view.addSubview(tabBar.view)
    }
    
    func displayAppropriateInitialVC() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let vc = SignUpVC()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
}
