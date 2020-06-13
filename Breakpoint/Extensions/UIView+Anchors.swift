//
//  Extensions.swift
//  Breakpoint
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0, height: CGFloat? = nil, width: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func centerWithConstant(x: NSLayoutXAxisAnchor? = nil, y: NSLayoutYAxisAnchor? = nil, xPadding: CGFloat = 0, yPadding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let x = x {
            centerXAnchor.constraint(equalTo: x, constant: xPadding).isActive = true
        }
        
        if let y = y {
            centerYAnchor.constraint(equalTo: y, constant: yPadding).isActive = true
        }
    }
    
    func centerX(to view: UIView, withMultiplierOf multiplier: CGFloat, andConstantOf constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func centerY(to view: UIView, withMultiplierOf multiplier: CGFloat, andConstantOf constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func setDimension(height: NSLayoutDimension? = nil, width: NSLayoutDimension? = nil, heightMultiplier: CGFloat = 1, widthMultiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
    }
    
    static func createHeaderView(withTitle title: String) -> UIView {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        
        let label = UILabel.createLabel(withText: title, ofSize: 20, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1), ofAlignment: .center)
        view.addSubview(label)
        label.centerWithConstant(x: view.centerXAnchor, y: view.centerYAnchor, yPadding: 10)
        
        return view
    }
}
