//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/15/22.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //Storyboard error init handler
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Custom initializer
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel // Color will change based on light and dark mode, light grey
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true // Auto resize font, long usernames will shrink to fit
        minimumScaleFactor = 0.75 //Auto resize font limit
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
