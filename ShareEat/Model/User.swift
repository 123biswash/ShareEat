//
//  User.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class User: PFObject, PFSubclassing {
    //MARK: Properties
    @NSManaged var address: String
    @NSManaged var userName:String
    @NSManaged var userEmail: String
    @NSManaged var userPhoneNum: String
    @NSManaged var profilePicture: PFFile
    @NSManaged var rating: Double
    var reviews: [Review] = []
    
    

    /* Needed to implement PFSubclassing interface */
    class func parseClassName() -> String {
        return "User"
    }
    
    
    
    
}
