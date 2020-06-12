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
        tf.backgroundColor = #colorLiteral(red: 0.191878289, green: 0.2040551007, blue: 0.2490101457, alpha: 1)
        tf.textColor = #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        
        return tf
    }
}
