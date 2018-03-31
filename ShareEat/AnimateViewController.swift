//
//  AnimateViewController.swift
//  ShareEat
//
//  Created by Biswash Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {

    @IBOutlet weak var mrLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.5) {
            self.mrLogo.center.y += 300
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
