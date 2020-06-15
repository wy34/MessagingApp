//
//  GroupVCCell.swift
//  Breakpoint
//
//  Created by William Yeung on 6/15/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class GroupVCCell: UITableViewCell {
    // MARK: - Properties
    private let groupTitleLabel = UILabel.createLabel(withText: "Group Title", ofSize: 20, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
    private let descriptionLabel = UILabel.createLabel(withText: "Group Description", ofSize: 14, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
    private let membersLabel = UILabel.createLabel(withText: "_members.", ofSize: 14, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
    
    private lazy var descriptionMembersStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [descriptionLabel, membersLabel])
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        anchorElements()
        backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper
    func anchorElements() {
        addSubview(groupTitleLabel)
        groupTitleLabel.setDimension(height: heightAnchor, heightMultiplier: 0.3)
        groupTitleLabel.anchor(top: topAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 10, paddingRight: 15, paddingLeft: 15)
        
        addSubview(descriptionMembersStack)
        descriptionMembersStack.anchor(top: groupTitleLabel.bottomAnchor, bottom: bottomAnchor, paddingTop: 5, paddingBottom: 5)
        descriptionMembersStack.setDimension(width: widthAnchor, widthMultiplier: 0.8)
        descriptionMembersStack.centerWithConstant(x: centerXAnchor)
    }
    
    func configureCell(title: String, description: String, memberCount: Int) {
        groupTitleLabel.text = title
        descriptionLabel.text = description
        membersLabel.text = "\(memberCount)"
    }
}
