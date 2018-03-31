//
//  ReviewCell.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import DateToolsSwift

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewDate: UILabel!
    
    @IBOutlet weak var reviewDescription: UILabel!
    
    
    var review: Review! {
        didSet {
              let date = review.createdAt
              reviewDate.text = "\(date?.daysAgo)days ago"
              reviewDescription.text = review.reviewDescription
        
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
