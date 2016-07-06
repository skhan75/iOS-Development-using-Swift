//
//  MapBarController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 7/4/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class MapBarController: UIViewController,MKMapViewDelegate{
    
    @IBOutlet var mapView: MKMapView!
    
    var locatables = [Locatable]()
    var dates: [Date] = [Date]()
    var lat: [Double] = [Double]()
    var long: [Double] = [Double]()
    let regionRadius: CLLocationDistance = 2000
    
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Locatable")
        
        do{
            try locatables = managedObjectContext?.executeFetchRequest(fetchRequest) as! [Locatable]
        }catch{
            print("ERROR: Cannot load data into table")
        }
        
       loadCompleteMap()
        
    }
    
    func loadCompleteMap() {
        
        for loc in locatables{
            let location1 = CLLocationCoordinate2DMake(Double(loc.latitude!), Double(loc.longitude!))
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location1
            dropPin.title = loc.address
            mapView.addAnnotation(dropPin)
        }
        let location1 = CLLocation(latitude: Double(locatables[0].latitude!), longitude: Double(locatables[0].longitude!))
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location1.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    @IBAction func mapType(sender: AnyObject) {
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
