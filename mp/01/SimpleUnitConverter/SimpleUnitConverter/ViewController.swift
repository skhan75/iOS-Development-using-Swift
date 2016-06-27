//
//  ViewController.swift
//  SimpleUnitConverter
//
//  Created by Sami Ahmad Khan on 6/9/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var unitsSegmentControl: UISegmentedControl!
    @IBOutlet weak var topTextValue: UITextField!
    @IBOutlet weak var bottomTextValue: UITextField!
    @IBOutlet weak var labelTextTop: UILabel!
    @IBOutlet weak var labelTextBottom: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    
    @IBAction func keyboardDismiss(sender: AnyObject) {
        topTextValue.resignFirstResponder()
        bottomTextValue.resignFirstResponder()
    }
    
    let converterObj = UnitConverter()
    
    @IBAction func unitSegmentSelection(sender: UISegmentedControl) {
        if(unitsSegmentControl.selectedSegmentIndex == 0){
            labelTextTop.text = "°F"
            labelTextBottom.text = "°C"
            topTextValue.text = ""
            bottomTextValue.text = ""
            topTextValue.placeholder = "Eg. 100"
            bottomTextValue.placeholder = "Eg. 37.18"
        }
        else if(unitsSegmentControl.selectedSegmentIndex == 1){
            labelTextTop.text = "Miles"
            labelTextBottom.text = "Kilometers"
            topTextValue.text = ""
            bottomTextValue.text = ""
            topTextValue.placeholder = "Eg. 20"
            bottomTextValue.placeholder = "Eg. 32.19"
        }
        else if(unitsSegmentControl.selectedSegmentIndex == 2){
            labelTextTop.text = "Gallons"
            labelTextBottom.text = "Litres"
            topTextValue.text = ""
            bottomTextValue.text = ""
            topTextValue.placeholder = "Eg. 10"
            bottomTextValue.placeholder = "Eg. 37.85"
        }
    }
    
    @IBAction func changeEvent(sender: UITextField) {
        let index = unitsSegmentControl.selectedSegmentIndex
        
        if(sender === topTextValue){
            
            
            if index == 0{
                let celsiusVal = converterObj.farToCel(sender)
                bottomTextValue.text = String(format:"%.2f", celsiusVal)
            }
            
            else if index == 1{
                let kiloVal = converterObj.milesTokilo(sender)
                bottomTextValue.text = String(format:"%.2f", kiloVal)
            }
            
            else if index == 2{
                let literVal = converterObj.gallonsToLiters(sender)
                bottomTextValue.text = String(format:"%.2f", literVal)
            }
        }
            
        else{
            if index == 0{
                let fahrenheitVal = converterObj.celToFar(sender)
                topTextValue.text = String(format:"%.2f", fahrenheitVal)
            }
            else if index == 1{
                let mileVal = converterObj.kiloToMiles(sender)
                topTextValue.text = String(format:"%.2f", mileVal)
            }
                
            else if index == 2{
                let gallonVal = converterObj.litersToGallons(sender)
                topTextValue.text = String(format:"%.2f", gallonVal)
            }
        }
    }
   
    @IBAction func changeArrows(sender: AnyObject) {
        if (sender === topTextValue) {
            arrowLabel.text = "⬇️"
        }
        
        else if (sender === bottomTextValue){
            arrowLabel.text = "⬆️"
        }
    }
    
    @IBAction func clearText(sender: UITextField) {
        let index = unitsSegmentControl.selectedSegmentIndex
        
        if(sender === topTextValue || sender === bottomTextValue){
            if index == 0 {
                topTextValue.text = ""
                bottomTextValue.text = ""
            }
                
            else if index == 1{
                topTextValue.text = ""
                bottomTextValue.text = ""
            }
                
            else if index == 2{
                topTextValue.text = ""
                bottomTextValue.text = ""
            }
        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        arrowLabel.text = "➡️"
    }


}

