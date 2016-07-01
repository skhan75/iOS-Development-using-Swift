//
//  PickerViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/1/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    var pickView = ["Address", "Violation Date", "CameraID", "#Violations"]
    var placementAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
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
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func submitSelectedPicker(sender: AnyObject) {
        
        if placementAnswer == 0{
            print ("Address selected")
        }
        
        else if placementAnswer == 1 {
            print ("Violation Date selected")
        }
        
        else if placementAnswer == 2 {
            print ("CameraID selected")
        }
        
        else {
            print ("#Violations selected")
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
    }
    
}
