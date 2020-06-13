//
//  UIButton.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UIButton {
    static func createButton(withTitle title: String, ofColor tColor: UIColor? = .white, backgroundColor bgColor: UIColor, image: UIImage? = nil, vc: UIViewController, selector: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(tColor, for: .normal)
        button.backgroundColor = bgColor
        button.titleLabel?.font = UIFont(name: "Menlo", size: 18)
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        if let image = image {
            button.setImage(image, for: .normal)
        }
        
        return button
    }
}
