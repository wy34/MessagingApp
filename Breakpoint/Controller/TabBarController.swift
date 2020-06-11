//
//  TabBarController.swift
//  Breakpoint
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class TabBarController: UIViewController {
    // MARK: - Properties
    private let tabBar: UITabBarController = {
        let tb = UITabBarController()
        
        let firstVC = FirstViewController()
        firstVC.tabBarItem = UITabBarItem(title: "1", image: nil, tag: 0)
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "2", image: nil, tag: 1)
        
        tb.viewControllers = [firstVC, secondVC]
        return tb
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper
    func configureUI() {
        view.addSubview(tabBar.view)
    }
}
