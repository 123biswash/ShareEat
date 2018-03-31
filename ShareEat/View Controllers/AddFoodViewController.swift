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
            <<< TextRow() {row in
                row.placeholder = "my food"
            }
            +++ Section("Food Category") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< TextRow() {row in
                row.placeholder = "type of food"
            }
            +++ Section("Amount") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< PushRow<String>() {
                    $0.title = "Serving size"
                    $0.selectorTitle = "Pick a number"
                    $0.options = ["One","Two","Three", "Four", "Five"]
                    $0.value = "One"    // initially selected
            }
            +++ Section("Description") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< TextAreaRow() {
                $0.placeholder = "Enter Food Description here"
            }
            +++ Section("Add your photos here") { section in
                section.header?.height = { 10 }
                section.footer?.height = { 10 }
            }
            <<< ImageRow() { row in
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
