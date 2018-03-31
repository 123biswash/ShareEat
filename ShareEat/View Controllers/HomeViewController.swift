//
//  HomeViewController.swift
//  ShareEat
//
//  Created by Anish Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addFoodButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.rowHeight = 400
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        
        addFoodButton.layer.borderWidth = 0.5
        addFoodButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        // Do any additional setup after loading the view.
        addFoodButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
        addFoodButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        loadPostFromParse()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadPostFromParse() {
        let query = PFQuery(className: "Post")
        query.addDescendingOrder("createdAt")
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if posts != nil {
                self.posts = posts as! [Post]
                print(self.posts)
            } else {
                print("Failed to get posts")
            }
            self.tableView.reloadData()
            //self.refreshControl.endRefreshing()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.post = self.posts[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
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
