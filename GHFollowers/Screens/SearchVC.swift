//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/8/22.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    //Computed property to check if the text entered is empty
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
        
        //Using system background will make the background color adapt in light and dark mode
        view.backgroundColor = .systemBackground
        
    }
    
    //override viewWillAppear because we want to hide the navigation bar everytime the view appears
    // doing in viewDidLoad will only do it once
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //Include the @Object because the #selector is from objective c
    @objc func pushFollowerListVC() {
        
        //Guard statement to check if username is empty
        guard isUsernameEntered else {
            presentsGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. The textfield is empty.", buttonTitle: "Ok")
            return
        }
        //To pass data:
        //Create the object, configure the data you want to pass and push the vc into the stack
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImageView() {
        //Place the image on the view controller
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        //Where to place the image on the view
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        //Place the text field on the view
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        //Where to place the image on the view
        // height of a touch target should be at least 44
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func configureCallToActionButton() {
        //Place the button on the view
        view.addSubview(callToActionButton)
        
        //Whenever we tap the get followers button, call the function pushFollowersListVC
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        //Where to place the image on the view
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}

//Delegate to customize action regarding the text field
extension SearchVC: UITextFieldDelegate {
    
    //What action do we want to customize when pressing the return button on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
