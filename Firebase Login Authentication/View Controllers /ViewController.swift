//
//  ViewController.swift
//  Firebase Login Authentication
//
//  Created by Amin  on 6/29/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }


}

extension ViewController {
    
    fileprivate func setUpElements() {
        
        Utilities.styleFilledButton(signupButton)
        Utilities.styleFilledButton(loginButton)
    }
}

