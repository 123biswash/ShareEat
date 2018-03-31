//
//  AddFoodViewController.swift
//  ShareEat
//
//  Created by Anish Adhikari on 3/30/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Eureka
import ImageRow

class AddFoodViewController: FormViewController {
    
    var post: [String: Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 5
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        }

        form +++ Section("Add Food name") { section in
            section.header?.height = { 30 }
            section.footer?.height = { 10 }
            }
            <<< TextRow("food_name") {row in
                row.placeholder = "food name"
            }
            +++ Section("Food Category") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< TextRow("food_type") {row in
                row.placeholder = "type of food"
            }
            +++ Section("Amount") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< PushRow<String>("serving_size") {
                    $0.title = "Serving size"
                    $0.selectorTitle = "Pick a number"
                    $0.options = ["One","Two","Three", "Four", "Five"]
                    $0.value = "One"    // initially selected
            }
            +++ Section("Description") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< TextAreaRow("description") {
                $0.placeholder = "Enter Food Description here"
            }
            +++ Section("Add your photos here") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< ImageRow("image") { row in
                row.title = "Food\nimage"
                row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                row.clearAction = .yes(style: UIAlertActionStyle.destructive)
            }.cellSetup({ (cell, row) -> () in
                    row.cell.height = {
                        return 340
                    }
                })
            +++ Section() { section in
                section.header?.height = { 5 }
                section.footer?.height = { 5 }
            }
            <<< ButtonRow() { row in
                row.title = "Post Food"
            
                }.onCellSelection({ (cell, row) in
                    self.postFood()
                })
        
//        let dict = form.values(includeHidden: true)
//        print(dict)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postFood() {
        let dict = self.form.values(includeHidden: true)
        Post.postFoodPost(withDict: dict) { (success: Bool, error: Error?) -> Void in
            if success {
                print("post success")
            } else {
                print("post error")
                self.presentAlert(msg: "Post Error", description: (error?.localizedDescription)!)
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func postFoodData(_ sender: Any) {
       // var data: [String: Any]
        postFood()
        //print(data)
    }
    
    func presentAlert(msg: String, description: String) {
        let alertController = UIAlertController(title: msg, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
