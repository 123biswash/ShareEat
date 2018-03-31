//
//  FoodCell.swift
//  ShareEat
//
//  Created by Anish Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import DateToolsSwift

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImage: PFImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var ratingNumberLabel: UILabel!
    @IBOutlet weak var servingCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var foodCategoryLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    var post: Post! {
        didSet {
            //userProfileImage.file = post.foodPicture
            postTitle.text = post.foodName
            postDescLabel.text = post.foodDescription
            servingCountLabel.text = "\(post.servingSize) Servings"
            foodCategoryLabel.text = post.foodCategory
            
            let date = post.createdAt
            timeLabel.text = date?.timeAgoSinceNow
            foodPriceLabel.text =  "$\(post.price)"
            
            getProfileInfo(user: post.author)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        userProfileImage.layer.cornerRadius = 40
        
        
    }
    
    func getProfileInfo(user: PFUser) {
        let id = user.objectId!
        let query = PFQuery(className:"_User")
        query.getObjectInBackground(withId: id) {
            (userObject: PFObject?, error: Error?) -> Void in
            if error != nil {
                print(error)
            } else if let object = userObject {
                
                //print("Location")
                
                if let profile_url = userObject!["profile_img"] {
                    self.userProfileImage.file = profile_url as! PFFile
                    self.userProfileImage.loadInBackground()
                }
            }
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
