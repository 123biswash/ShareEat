//
//  DetailsViewController.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import ParseUI
import DateToolsSwift

class DetailsViewController: UIViewController {

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var foodImageView: PFImageView!
    @IBOutlet weak var foodDetailDescriptionLabel: UILabel!
    @IBOutlet weak var timeSincePostLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var chefNameLabel: UILabel!
    @IBOutlet weak var chefImageView: PFImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var post: Post!
    
    var sellerLocation: String! = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       buyButton.layer.borderWidth = 0.5
        buyButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        // Do any additional setup after loading the view.
        buyButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
        buyButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        chefImageView.layer.cornerRadius = 45

        // Do any additional setup after loading the view.
        loadDetailView()
    }
    
    func loadDetailView() {
        foodImageView.file = post.foodPicture
        foodImageView.loadInBackground()
        foodNameLabel.text = post.foodName
        foodDetailDescriptionLabel.text = post.foodDescription
        timeSincePostLabel.text = post.createdAt?.shortTimeAgoSinceNow
        categoryLabel.text = post.foodCategory
        print("loading")
        getProfileInfo(user: post.author)
    }
    
    func getProfileInfo(user: PFUser) {
        let id = user.objectId!
        let query = PFQuery(className:"_User")
        query.getObjectInBackground(withId: id) {
            (userObject: PFObject?, error: Error?) -> Void in
            if error != nil {
                print(error)
            } else if let object = userObject {
                self.chefNameLabel.text = userObject!["name"] as! String
                print(userObject)
                let sellLocation = userObject!["address"] as! String
                
                self.sellerLocation = sellLocation
                
                //print("Location")
                
                if let profile_url = userObject!["profile_img"] {
                    self.chefImageView.file = profile_url as! PFFile
                    self.chefImageView.loadInBackground()
                }
            }
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
  
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBuy(_ sender: Any) {
        if sellerLocation != nil {
            performSegue(withIdentifier: "sendLocation", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as! MapViewController
        mapVC.location = sellerLocation
        mapVC.s_user = self.post.author
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
