//
//  UIImageView.swift
//  Breakpoint
//
//  Created by William Yeung on 6/12/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

extension UIImageView {
    static func createImageView(withImage image: UIImage) -> UIImageView {
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }
}
