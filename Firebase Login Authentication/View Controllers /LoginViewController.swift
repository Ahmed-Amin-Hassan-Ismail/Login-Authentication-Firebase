//
//  LoginViewController.swift
//  Firebase Login Authentication
//
//  Created by Amin  on 6/29/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit
import  FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    
    // Actions
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate for textFields
        let error = validateFields()
        
        if error != nil {
            errorMessage(error!)
        } else {
            // Create clean email
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // singu for home screen
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
                guard let self = self else { return }
                if error != nil {
                    self.errorMessage("can't sign up, please create a new email")
                } else {
                    self.navigateToHome()
                }
                
            }
        }
        
        
    }
    
    
}

extension LoginViewController {
    
    fileprivate func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(loginButton)
    }
    
    fileprivate func validateFields() -> String? {
        
        // trimming to remove any sapce and special character
        // Check the field is incorrect return mesaage otherwise return nil
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill your empty fields, and try again!"
        }
        
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "password is not secure enough, please make sure your password at least 8 charcter and contains special character"
        }
        
        return nil
    }
    
    
    fileprivate func errorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    fileprivate func navigateToHome() {
           let homeViewController  = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
       }
    
}
