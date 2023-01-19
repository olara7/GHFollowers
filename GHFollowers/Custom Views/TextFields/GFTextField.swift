//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/8/22.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false //auto layout
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true //Font will shrink if username is large to fit
        minimumFontSize = 12 //Set a limit to the font shrink
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no //Usernames don't benefit from auto correction
        returnKeyType = .go
        clearButtonMode = .whileEditing
        
        placeholder = "Enter a username"
    }
}
