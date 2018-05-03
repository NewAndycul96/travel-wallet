//
//  MapViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapOfHotel: MKMapView!
    
    
    var address: String = ""
    
    let startLatitude = 38.947404
    let startLongitude = -92.327259
    let latitudeDelta = 0.01
    let longitudeDelta = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapOfHotel.showsBuildings = true
        mapOfHotel.showsCompass = true
        mapOfHotel.showsScale = true
        mapOfHotel.showsPointsOfInterest = true
        mapOfHotel.showsTraffic = true
        
        // Do any additional setup after loading the view.
        let startLocation = CLLocation(latitude: startLatitude, longitude: startLongitude)
        showLocation(for: startLocation)
        
        coordinate(for: address) {
            (location) in
            self.showLocation(for: location)
        }
    }
    func coordinate(for address: String, responseHandler: @escaping (CLLocation?) -> Void) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard let placemarks = placemarks,
                let location = placemarks.first?.location else {
                    responseHandler(nil)
                    return
            }
            responseHandler(location)
        }
    }
    
    func showLocation(for location: CLLocation?) {
        guard let location = location else {
            return
        }
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapOfHotel.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = address
        annotation.subtitle = "above is address"
        
        mapOfHotel.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

