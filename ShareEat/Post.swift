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
    @NSManaged var foodPicture : PFFile
    @NSManaged var author: PFUser
    @NSManaged var foodName: String
    @NSManaged var foodDescription: String
    @NSManaged var cookedTime: String
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
    class func postFoodPost(image: UIImage?, withDescription foodDescription: String?, withFoodName foodName: String?, withCookedTime cookedTime: String?,withCatageory foodCategory: String?, withCompletion completion: PFBooleanResultBlock?) {
        // use subclass approach
        let post = Post()
        
        // Add relevant fields to the object
        post.foodPicture = getPFFileFromImage(image: image)! // PFFile column type
        post.author = PFUser.current()! // Pointer column type that points to PFUser
        post.foodDescription = foodDescription!
        post.cookedTime = cookedTime!
        post.foodCategory = foodCategory!
        post.foodName = foodName!
        
        
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
