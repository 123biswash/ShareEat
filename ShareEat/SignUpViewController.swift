//
//  SignUpViewController.swift
//  ShareEat
//
//  Created by Anish Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNoField.borderStyle = UITextBorderStyle.roundedRect
        phoneNoField.borderStyle = UITextBorderStyle.roundedRect
        
        emailField.borderStyle = UITextBorderStyle.roundedRect
        emailField.borderStyle = UITextBorderStyle.roundedRect
        
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        
        addressField.borderStyle = UITextBorderStyle.roundedRect
        addressField.borderStyle = UITextBorderStyle.roundedRect
        
        signUpButton.layer.borderWidth = 0.5
        signUpButton.layer.borderColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1).cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
