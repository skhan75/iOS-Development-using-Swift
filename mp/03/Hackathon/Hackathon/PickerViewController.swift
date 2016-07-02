//  PickerViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/1/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var othersButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    var attribute : String? = nil
   
    
    var pickView = ["Address", "Violation Date", "CameraID"]
    var placementAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        dateButton.hidden = true
        othersButton.enabled = false
        dateButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickView[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickView.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func submitSelectedPicker(sender: UIButton) {
        
        if placementAnswer == 0{
            print ("Address selected")
            attribute = "address"
            dateButton.hidden = true
            othersButton.hidden = false
            othersButton.enabled = true
        }
        
        else if placementAnswer == 1 {
           // performSegueWithIdentifier(<#T##identifier: String##String#>, sender: sender)
            dateButton.hidden = false
            dateButton.enabled = true
            othersButton.hidden = true
        }
        
        else if placementAnswer == 2 {
            print ("CameraID selected")
            attribute = "cameraID"
            dateButton.hidden = true
            othersButton.hidden = false
            othersButton.enabled = true
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Locatable" {
            let controller = segue.destinationViewController as! TableViewController
            controller.objectsToShown = attribute
            othersButton.enabled = false
            
        }
        
        if segue.identifier == "Date" {
            dateButton.enabled = false
        }
    }
    

    
}
