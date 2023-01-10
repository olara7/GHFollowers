//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Oscar Lara on 12/20/22.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //Storyboard error init handler
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Custom initializer
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel // Color will change based on light and dark mode, light grey
        adjustsFontSizeToFitWidth = true // Auto resize font, long usernames will shrink to fit
        minimumScaleFactor = 0.90 //Auto resize font limit
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
