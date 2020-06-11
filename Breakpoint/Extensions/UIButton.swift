//
//  UIButton.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func createButton(withTitle title: String, ofColor tColor: UIColor? = .white, backgroundColorOf bgColor: UIColor, imageOf: UIImage? = nil) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(tColor, for: .normal)
        button.backgroundColor = bgColor
        button.titleLabel?.font = UIFont(name: "Menlo", size: 18)
        if let image = imageOf {
            button.setImage(image, for: .normal)
        }
        return button
    }
}
