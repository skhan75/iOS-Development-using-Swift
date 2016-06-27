//
//  UnitConverter.swift
//  SimpleUnitConverter
//
//  Created by Sami Ahmad Khan on 6/10/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import Foundation
import UIKit

class UnitConverter{
    
    //Conversion code
    func farToCel(far : UITextField)->Double{
        var fahrenheit: Double = 0.0
        var celsius: Double = 0.0
        
        if let fval = NSNumberFormatter().numberFromString(far.text!){
            fahrenheit = fval.doubleValue
        }
        celsius = (fahrenheit - 32)*(5/9)
        return celsius
    }
    
    func celToFar(cel: UITextField) -> Double {
        var fahrenheit: Double = 0.0
        var celsius: Double = 0.0

        if let cval = NSNumberFormatter().numberFromString(cel.text!){
            celsius = cval.doubleValue
        }
        fahrenheit = (celsius * (9/5)) + 32
        return fahrenheit
    }
    
    func milesTokilo(mil: UITextField) -> Double {
        var miles: Double = 0.0
        var kilometers: Double = 0.0
        if let mval = NSNumberFormatter().numberFromString(mil.text!){
            miles = mval.doubleValue
        }
        
        kilometers = (1.60934721869 * miles)
        return kilometers
    }
    
    func kiloToMiles(kil: UITextField) -> Double {
        var miles: Double = 0.0
        var kilometers: Double = 0.0
        if let kval = NSNumberFormatter().numberFromString(kil.text!){
            kilometers = kval.doubleValue
        }
        
        miles = 0.621371 * kilometers
        return miles
    }
    
    func gallonsToLiters(gal: UITextField) -> Double {
        var gallons: Double = 0.0
        var liters: Double = 0.0
        if let gval = NSNumberFormatter().numberFromString(gal.text!){
            gallons = gval.doubleValue
        }
        
        liters = 3.78541 * gallons
        return liters
    }
    
    func litersToGallons(lit: UITextField) -> Double{
        var gallons: Double = 0.0
        var liters: Double = 0.0
        if let lval = NSNumberFormatter().numberFromString(lit.text!){
            liters = lval.doubleValue
        }
        
        gallons = 0.264172  * liters
        return gallons
    }
    
}