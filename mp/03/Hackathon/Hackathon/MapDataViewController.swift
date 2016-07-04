//
//  MapDataViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/3/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class MapDataViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var addressTextLabel: UILabel!
    @IBOutlet weak var cameraIDLabel: UILabel!
    @IBOutlet weak var violationDateLabel: UILabel!
    @IBOutlet weak var noOfViolationsLabel: UILabel!
    var addressObj: Locatable? = nil
    var dateObj : Date? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
    }
    
    func loadMap(){
        print(addressObj?.address)
        print(dateObj?.violationDate)
        addressTextLabel.text = addressObj?.address
        violationDateLabel.text = dateObj?.violationDate
        cameraIDLabel.text = addressObj?.cameraID
        
    }
    
}
