//
//  UITextField.swift
//  Breakpoint
//
//  Created by William Yeung on 6/11/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UITextField {
    static func createTextField(withPlaceholderOf ph: String) -> UITextField {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        
        return tf
    }
}
