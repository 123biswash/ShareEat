//
//  Post.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse



class Post: PFObject, PFSubclassing{
    //Mark Properties
    @NSManaged var foodPicture : PFFile?
    @NSManaged var author: PFUser
    @NSManaged var foodName: String
    @NSManaged var foodDescription: String
    @NSManaged var servingSize: Int
    @NSManaged var foodCategory: String
    
     /* Needed to implement PFSubclassing interface */
    class func parseClassName() -> String {
        return "Post"
    }
    
    /**
     Method to add a user post to Parse (uploading a food post)
     
     - parameter image: image of the food
     - parameter caption: food description
     - parameter completion: Block to be executed after save operation is complete
     */
    class func postFoodPost(withDict dict: [String: Any]?, withCompletion completion: PFBooleanResultBlock?) {
        // use subclass approach
        let post = Post()
        
        let food_image = dict!["image"]
        let foodDescription = dict!["description"]
        let servingSizes = dict!["serving_size"]
        let foodCategory = dict!["food_type"]
        let foodName = dict!["food_name"]
        // Add relevant fields to the object
        post.foodPicture = getPFFileFromImage(image: food_image as? UIImage)
        post.author = PFUser.current()! // Pointer column type that points to PFUser
        post.foodDescription = foodDescription! as! String
        //post.cookedTime = cookedTime!
        switch servingSizes as! String {
        case "One":
            post.servingSize = 1
        case "Two":
            post.servingSize = 2
        case "Three":
            post.servingSize = 3
        case "Four":
            post.servingSize = 4
        case "Five":
            post.servingSize = 5
        default:
            post.servingSize = 1
        }
        
        post.foodCategory = foodCategory! as! String
        post.foodName = foodName! as! String
        
        
        // Save object (following function will save the object in Parse asynchronously)
        post.saveInBackground(block: completion)
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    
    
}
