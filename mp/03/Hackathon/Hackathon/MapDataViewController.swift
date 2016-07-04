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
import Foundation


class MapDataViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var addressTextLabel: UILabel!
    @IBOutlet weak var cameraIDLabel: UILabel!
    @IBOutlet weak var violationDateLabel: UILabel!
    @IBOutlet weak var noOfViolationsLabel: UILabel!
    var addressObj: Locatable? = nil
    var dateObj : Date? = nil
    var lat: Double = Double()
    var long: Double = Double()
    var location1: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let initialLocation = CLLocation(latitude: 41.8349, longitude: 87.6270)
        //centerMapOnLocation(initialLocation)
        self.mapView.delegate = self
        loadMap()
    }
    
    func loadMap(){
        
        lat = addressObj?.latitude as! Double
        long = addressObj?.longitude as! Double
        let location = CLLocation(latitude: lat, longitude: long)
        location1 = CLLocationCoordinate2DMake(lat, long)
        centerMapOnLocation(location)
        
        print(addressObj?.address)
        print(dateObj?.violationDate)
        addressTextLabel.text = addressObj?.address
        violationDateLabel.text = dateObj?.violationDate
        cameraIDLabel.text = addressObj?.cameraID
        
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location1
        dropPin.title = addressObj?.address
        mapView.addAnnotation(dropPin)
    }
    
    
    
    @IBAction func mapViewType(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = MKMapType.Standard
        }
        
        else if sender.selectedSegmentIndex == 1 {
            mapView.mapType = MKMapType.Satellite
        }
        
        else if sender.selectedSegmentIndex == 2 {
            mapView.mapType = MKMapType.Hybrid
        }
    }
    
    
    
    
}
