//
//  ViewController.swift
//  NoteTakingApp
//
//  Created by robin on 2018-07-09.
//  Copyright © 2018 robin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var noteText: UITextField!
    
    var groceryList: [GroceryListItem] = []
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSampleData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addSampleData() {
        for x in 1...5 {
            
            let randomWords = "This is item \(x)"
            
            let item:GroceryListItem = GroceryListItem(item: randomWords)

            groceryList.append(item)
        }
    }

    @IBAction func addNote(_ sender: Any) {
        print("clicked!")
        
        // check if textbox is empty
        guard let x = noteText.text , x != "" else {
            print("textbox is empty")
            return
        }
        
        // create a note and save to system
        let item : GroceryListItem = GroceryListItem(item:x)
        groceryList.append(item);
        
        // clear the textbox
        noteText.text = ""
        
        // create an alert box to show user
        
        // -- make an alert
        let alert = UIAlertController(title: "Save Complete", message: "Your item was saved!", preferredStyle: .alert)
        
        // -- add a button
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        // -- show the popup
        self.present(alert, animated: true, completion: nil)
       
        
    }

    @IBAction func showAll(_ sender: Any) {
        for item in groceryList {
            print("\(item.dateAdded): \(item.itemName)")
        }
    }
}

