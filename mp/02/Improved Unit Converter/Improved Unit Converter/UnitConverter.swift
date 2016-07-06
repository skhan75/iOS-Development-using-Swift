//
//  UnitConverter.swift
//  Improved Unit Converter
//
//  Created by Sami Ahmad Khan on 6/19/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import Foundation
import UIKit

class UnitConverter {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var enteredValue: Double = 0.0
    var x: Double = 0.0
    var convertedUnitLabels = [Double]()
    var labelValue: Double = Double()
    var labelValue1: [Double] = [Double]()
    
    func valueCalculation (row : Int, category : String, enteredValueByUser : String, tableView : UITableView) -> [Double]{
        
        let dict = appDelegate.stylesheet!
        let keysInPlist = dict[category]

        var keyArr = keysInPlist!.allKeys! as! [NSString]
        keyArr = keyArr.reverse()
        let selectedRowValue = keysInPlist![keyArr[row]]!!
        
        if selectedRowValue is NSArray {
            
            if let label = NSNumberFormatter().numberFromString(enteredValueByUser){
                enteredValue = label.doubleValue
            }
            labelValue1 = selectedRowValue as! [Double]
            print("LabelValue: ", labelValue1)
            var baseVal: Double = enteredValue + labelValue1[1]
            baseVal = baseVal / labelValue1[0]
            //print(baseVal)
            print(keysInPlist)
            var j: Int = 0
            while (j < keysInPlist?.count){
                
                if (j == row){
                    j += 1
                    continue;
                }
                
                let factors = keysInPlist![keyArr[j]]!! as! [Double]
                
                print("KeyArr", keyArr[j])
                print(keysInPlist![keyArr[j]]!!)
                print (factors)
                var convertedVal1 = baseVal - factors[1]
                convertedVal1 = convertedVal1 * factors[0]
                
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: 0)) as! TableViewCell
                cell.value.text = String(format:"%.2f", convertedVal1)
                
                j += 1
            }
            enteredValue = 0.0
            
        }
        
        else{
            if let label = NSNumberFormatter().numberFromString(enteredValueByUser){
                enteredValue = label.doubleValue
            }
            labelValue = selectedRowValue as! Double
            var j: Int = 0
            
            while (j < keysInPlist?.count){
                if (j == row){
                    j += 1
                    continue;
                }
                let value = keysInPlist![keyArr[j]]!! as! Double
            
                let convertedVal: Double = ((value / labelValue) * enteredValue)
            
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: j, inSection: 0)) as! TableViewCell
                cell.value.text = String(format:"%.2f", convertedVal)
                
                j += 1
            }
            enteredValue = 0.0
        }
        return (convertedUnitLabels)
    }
}
