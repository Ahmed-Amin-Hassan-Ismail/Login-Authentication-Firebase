//
//  SignUpViewController.swift
//  Firebase Login Authentication
//
//  Created by Amin  on 6/29/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    // Actions
    @IBAction func signUpTapped(_ sender: Any) {
    }

}

extension SignUpViewController {
    
    // MARK: - Helper methods
    
    fileprivate func setupElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
    }
}
