//
//  ViewController.swift
//  FBtest
//
//  Created by robin on 2018-07-19.
//  Copyright © 2018 robin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController {

    var db: DatabaseReference!
    @IBOutlet weak var btn: UIButton!
    
   
    @IBOutlet weak var textA: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.db = Database.database().reference()
        
        watchChanges()
        //Know when data changes(Adding)
        
        
    }

    func watchChanges(){
        self.db.child("todo").observe(DataEventType.childAdded, with: {
            (snapshot) in
            
            print("something changed in the database")
            
            //getting the value which has been added to database
            let x = snapshot.value
            print(x)
            
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btn(_ sender: Any) {
        print("Add task")
        let x = textA.text
        
        if(x?.isEmpty == true){
            return
        }
        
        self.db.child("todo").childByAutoId().setValue(x)
    }

}

