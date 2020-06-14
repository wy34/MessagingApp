//
//  FeedCell.swift
//  Breakpoint
//
//  Created by William Yeung on 6/13/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    // MARK: - Properties
    private let senderImage = UIImageView.createImageView(withImage: #imageLiteral(resourceName: "defaultProfileImage"))

    private let senderEmailLabel: UILabel = {
        let label = UILabel.createLabel(withText: "user@breakpoint.com", ofSize: 18, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Message content Message content Message content Message content Message content Message content Message content Message content Message content ", ofSize: 12, ofColor: #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1))
        label.numberOfLines = 2
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
   
    private lazy var messageStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [senderEmailLabel, messageLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = -20
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
        addSubview(senderImage)
        senderImage.setDimension(height: widthAnchor, width: widthAnchor, heightMultiplier: 0.18, widthMultiplier: 0.18)
        senderImage.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, paddingTop: 15, paddingBottom: 15, paddingLeft: 15)
        
        addSubview(messageStackView)
        messageStackView.setDimension(height: heightAnchor, heightMultiplier: 0.8)
        messageStackView.centerWithConstant(y: centerYAnchor, yPadding: 10)
        messageStackView.anchor(right: rightAnchor, left: senderImage.rightAnchor, paddingRight: 15, paddingLeft: 15)
    }
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        senderImage.image = profileImage
        senderEmailLabel.text = email
        messageLabel.text = content
    }
}
