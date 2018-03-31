//
//  DetailsViewController.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import  HCSStarRatingView

class DetailsViewController: UIViewController {

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodDetailDescriptionLabel: UILabel!
    @IBOutlet weak var timeSincePostLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var chefNameLabel: UILabel!
    @IBOutlet weak var chefImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       buyButton.layer.borderWidth = 0.5
        buyButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        // Do any additional setup after loading the view.
        buyButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
        buyButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
  
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBuy(_ sender: Any) {
        
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