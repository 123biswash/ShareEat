//
//  SignUpViewController.swift
//  ShareEat
//
//  Created by Anish Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    
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
        
        fullNameField.borderStyle = UITextBorderStyle.roundedRect
        fullNameField.borderStyle = UITextBorderStyle.roundedRect
        
        signUpButton.layer.borderWidth = 0.5
        signUpButton.layer.borderColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1).cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        
        let full_name = fullNameField.text
        let phone = phoneNoField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let address = addressField.text
        let email = emailField.text
        if (phone?.isEmpty)! {
            presentAlert(msg: "Phone Required", description: "Please enter your Phone number and password")
            return
        } else if (password?.isEmpty)! {
            presentAlert(msg: "Password Required", description: "Please enter your Phone number and password")
            return
        } else if (full_name?.isEmpty)! {
            presentAlert(msg: "Name Required", description: "Please enter your full name")
            return
        } else if (email?.isEmpty)! {
            presentAlert(msg: "Email Required", description: "Please enter your Email")
            return
        } else if (address?.isEmpty)! {
            presentAlert(msg: "Address Required", description: "Please enter your full address")
            return
        }
        
        
        user.username = phone
        user.password = password
        user.email = email
        // other fields can be set just like with PFObject
        user["phone"] = phone
        user["address"] = address
        user["name"] = full_name
        
        
        user.signUpInBackground { (succeeded: Bool, error: Error?) ->Void in
            if succeeded {
                self.clearFields()
                // Show the errorString somewhere and let the user try again.
            } else {
                let errorString = error?.localizedDescription
                print(error?.localizedDescription)
                 self.presentAlert(msg: "Login Failed", description: errorString!)
                // Hooray! Let them use the app now.
            }
        }
        
    }
    
    func clearFields() {
        phoneNoField.text = ""
        emailField.text = ""
        addressField.text = ""
        fullNameField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func presentAlert(msg: String, description: String) {
        let alertController = UIAlertController(title: msg, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
