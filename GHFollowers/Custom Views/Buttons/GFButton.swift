//
//  GFButton.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/8/22.
//

import UIKit

class GFButton: UIButton {
    
    //Calling override init function because we are going to override the
    //default settings for the button and customize it
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //Return error if GFButton is initalized through storyboard
    //Because we are implementing programmatically
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Custom initializer to change the color and title of the button
    init(backgroundColor: UIColor, title: String) {
        //Initialize with a frame of zero because we are using auto layout
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        //Configure the button
        
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false //Use autolayout
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
