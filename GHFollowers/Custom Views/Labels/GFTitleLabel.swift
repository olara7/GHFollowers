//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/15/22.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //Storyboard error init handler
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Custom initializer
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor = .label // Color will change based on light and dark mode
        adjustsFontSizeToFitWidth = true // Auto resize font, long usernames will shrink to fit
        minimumScaleFactor = 0.9 //Auto resize font limit
        lineBreakMode = .byTruncatingTail //Username that it still long in shrinked factor will trail with a ...
        translatesAutoresizingMaskIntoConstraints = false
    }
}
