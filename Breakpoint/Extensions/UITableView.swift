//
//  UITableView.swift
//  Breakpoint
//
//  Created by William Yeung on 6/12/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UITableView {
    static func createBasicTableView(withReuseId reuseId: String, andBackgroundColorOf bgColor: UIColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)) -> UITableView {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tv.backgroundColor = bgColor
        return tv
    }
}
