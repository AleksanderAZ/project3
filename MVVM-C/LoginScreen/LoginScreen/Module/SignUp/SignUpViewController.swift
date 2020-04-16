//
//  SignUpViewController.swift
//  LoginScreen
//
//  Created by Oleksander on 17.04.2020.
//  Copyright © 2020 Oleksander. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    var signupViewModel: SignUpViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    private func refreshDisplay()
    {
        guard isLoaded else { return }
        
        if let signupViewModel = signupViewModel {
            emailField.text = signupViewModel.email
            passwordField.text = signupViewModel.password
            errorMessageLabel.text = signupViewModel.errorMessage
            loginButton.enabled = signupViewModel.canSubmit
        }
        else {
            emailField.text = ""
            passwordField.text = ""
            errorMessageLabel.text = ""
            loginButton.enabled = false
        }
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        signupViewModel?.submit()
    }
    
    func emailFieldDidChange(textField: UITextField) {
        if let text = textField.text {
            signupViewModel?.email = text
        }
    }
    
    func passwordFieldDidChange(textField: UITextField) {
        if let text = textField.text {
            signupViewModel?.password = text
        }
    }
}
