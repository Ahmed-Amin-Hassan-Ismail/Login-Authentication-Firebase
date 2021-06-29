//
//  LoginViewController.swift
//  Firebase Login Authentication
//
//  Created by Amin  on 6/29/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Actions
    @IBAction func loginTapped(_ sender: Any) {
    }
    

}
