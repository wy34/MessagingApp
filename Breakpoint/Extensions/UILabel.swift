//
//  UILabel.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UILabel {
    static func createLabel(withText text: String, ofSize size: CGFloat, ofColor color: UIColor, ofAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Menlo", size: size)
        label.font = UIFont.systemFont(ofSize: size, weight: .bold)
        label.textColor = color
        label.textAlignment = ofAlignment
        return label
    }
}
