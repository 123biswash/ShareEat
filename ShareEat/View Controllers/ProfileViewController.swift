//
//  ProfileViewController.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MBProgressHUD

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var reviews: [Review] = []
    
    var user: PFUser = PFUser.current()!
   
    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImage: PFImageView!
    @IBOutlet weak var addressLabel: UILabel!
    var postImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         userProfileImage.layer.cornerRadius = 20
         reviewsTableView.dataSource = self
         reviewsTableView.delegate = self
        
        
        getProfileInfo(user: user)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        cell.review = reviews[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getProfileInfo(user: PFUser) {
        let id = user.objectId!
        let query = PFQuery(className:"_User")
        query.getObjectInBackground(withId: id) {
            (userObject: PFObject?, error: Error?) -> Void in
            if error != nil {
                print(error)
            } else if let object = userObject {
                self.userNameLabel.text = userObject!["name"] as! String
                let address = userObject!["address"] as! String
//                print(address)
                self.addressLabel.text = "Address: \(address)"
                if let profile_url = userObject!["profile_img"] {
                    self.userProfileImage.file = profile_url as! PFFile
                    self.userProfileImage.loadInBackground()
                }
            }
        }
        
    }
    
    @IBAction func editProfileImage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        userProfileImage.image = editedImage
        // Do something with the images (based on your use case)
        postImageToParse(image: editedImage)
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func postImageToParse(image: UIImage) {
        
        if image != nil {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            //post image to parse
            print("post Image to parse")
            //
            let id = user.objectId!
            let object = PFObject(withoutDataWithClassName: "_User", objectId: id)
            object["profile_img"] = getPFFileFromImage(image: image)
            object.saveInBackground(block: { (success: Bool, error: Error?) in
                if success {
                    print("saved image")
                    MBProgressHUD.hide(for: self.view, animated: true)
                } else {
                    print("Error")
                }
            })
            
            
        }
    }
    
    func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
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
