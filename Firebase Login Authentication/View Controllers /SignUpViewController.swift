//
//  SignUpViewController.swift
//  Firebase Login Authentication
//
//  Created by Amin  on 6/29/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

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
        
        // validate the fields
        let error = validateFields()
        
        if error != nil {
           showErrorMessage(error!)
        } else {
            // Create the users
            let cleanedFirstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedLastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: cleanedEmail, password: cleanedPassword) { [weak self] (result, errors) in
                guard let self = self else { return }
                
                if errors != nil {
                    self.showErrorMessage("Error Creating by user")
                } else {
                    let _ = Firestore.firestore().collection("Users").addDocument(data: [ cleanedFirstName:"firstName", cleanedLastName: "lastName", "uid": result!.user.uid ]) { (errors) in
                        
                        if errors != nil {
                            self.showErrorMessage("Error saving data")
                        }
                    }
                    self.transitionToHome()
                }
                
            }
        }
        
        
        
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
    
    fileprivate func validateFields() -> String? {
        
        // To remove any sapces and new lines
        // i means if users clicks space while in textfield it ignores and acts if the textfield is empty
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "please fill any empty field, it's required"
        }
        
        // Validate for password
        let newPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(newPassword) == false {
            return " please make sure your password is at least 8 characters, contains special characters and numbers."
        }
        return nil
    }
    
    fileprivate func showErrorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    fileprivate func transitionToHome() {
        let homeViewController = UIStoryboard().instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
