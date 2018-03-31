//
//  LoginViewController.swift
//  ShareEat
//
//  Created by Biswash Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var isBothTextFieldEditing: Bool = false
    var loginButtonsHighlighted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        
        signInButton.layer.borderWidth = 0.5
        signInButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        
        signUpButton.layer.borderWidth = 0.5
        signUpButton.layer.borderColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1).cgColor
        
        userNameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if userNameField.text != "" && passwordField.text != "" {
            isBothTextFieldEditing = true
        } else {
            isBothTextFieldEditing = false
        }
        
        if isBothTextFieldEditing && !loginButtonsHighlighted {
            signInButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
            signInButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            loginButtonsHighlighted = true
        }
        
        if !isBothTextFieldEditing && loginButtonsHighlighted {
            signInButton.layer.backgroundColor = nil
            signInButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9), for: .normal)
            loginButtonsHighlighted = false
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
