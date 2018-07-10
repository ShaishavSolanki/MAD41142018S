//
//  ViewController.swift
//  SaveVolume
//
//  Created by robin on 2017-11-08.
//  Copyright © 2017 robin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //variables
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderValue: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //get the last value of the label
        sliderValue.text = defaults.string(forKey: "Volume")
        
        //get the last position of the slider
        slider.value = defaults.float(forKey: "sliderValue")

        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSlider(_ sender: UISlider) {
        
        //var currentValue = Int(sender.value)
        //print("Sldier Value Changing")
        
        sliderValue.text = "\(slider.value)"
       
        //set the value of the text
        defaults.set(sliderValue.text, forKey:"Volume")
        
        //set the position of the slider
        defaults.set(slider.value,forKey:"sliderValue")
        
        
        
        
        
        
        
    }
}

