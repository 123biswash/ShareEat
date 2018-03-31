//
//  Review.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class Review: PFObject {
    //MARK: Properties
    @NSManaged var ratingsCounts: Int
    @NSManaged var reviewDescription: String
    
    /* Needed to implement PFSubclassing interface */
    class func parseClassName() -> String {
        return "Review"
    }
    
    
    //MARK: Initialization
    

}
