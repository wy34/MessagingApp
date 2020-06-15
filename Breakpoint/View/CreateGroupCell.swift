//
//  CreateGroupCell.swift
//  Breakpoint
//
//  Created by William Yeung on 6/14/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class CreateGroupCell: UITableViewCell {
    // MARK: - Properties
    private let addedUserImage: UIImageView = {
        let iv = UIImageView.createImageView(withImage: #imageLiteral(resourceName: "defaultProfileImage"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel.createLabel(withText: "user@breakpoint.com", ofSize: 18, ofColor: #colorLiteral(red: 0.5607843137, green: 0.8117647059, blue: 0.3058823529, alpha: 1))
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let checkedImage = UIImageView.createImageView(withImage: #imageLiteral(resourceName: "whiteCheckmark"))
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        anchorElements()
        backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        checkedImage.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Helper
    func anchorElements() {
        addSubview(addedUserImage)
        addedUserImage.setDimension(height: widthAnchor, width: widthAnchor, heightMultiplier: 0.18, widthMultiplier: 0.18)
        addedUserImage.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 10)
        
        addSubview(emailLabel)
        emailLabel.setDimension(width: widthAnchor, widthMultiplier: 0.6)
        emailLabel.centerWithConstant(x: centerXAnchor, y: centerYAnchor, xPadding: 20)
        
        addSubview(checkedImage)
        checkedImage.setDimension(height: widthAnchor, width: widthAnchor, heightMultiplier: 0.06, widthMultiplier: 0.06)
        checkedImage.anchor(right: rightAnchor, paddingRight: 10)
        checkedImage.centerWithConstant(y: centerYAnchor)
    }
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.addedUserImage.image = image
        emailLabel.text = email
        checkedImage.isHidden = isSelected ? false :  true
    }
}
