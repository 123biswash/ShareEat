//
//  MapViewController.swift
//  ShareEat
//
//  Created by Pranaya Adhikari on 3/31/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import WebKit
import Parse
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    var url: String = "https://www.google.com/maps"
    @IBOutlet weak var cancelButton: UIButton!
   
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var mapKitView: WKWebView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                self.performUrlOperation()
            }
            else{
                print("Location service disabled");
            }
        }
    
        

        // Do any additional setup after loading the view.
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func performUrlOperation() {
            var locValue:CLLocation = locationManager.location!
        
            let long = locValue.coordinate.longitude
            let lat = locValue.coordinate.latitude
        
        
            var sellerLat:Double = 0.0
            var sellerLng:Double = 0.0
        
            print (locValue)
        
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString("1600 Pennsylvania Ave NW, Washington, DC 20500") {
                placemarks, error in
                let placemark = placemarks?.first
                sellerLat = (placemark?.location?.coordinate.latitude)!
                sellerLng = (placemark?.location?.coordinate.longitude)!
                print("Lat: \(sellerLat), Lon: \(sellerLng)")
                
                self.url = "https://www.google.com/maps/dir/\(lat),\(long)/\(sellerLat),\(sellerLng)"
                
                self.loadUrlWebView()
                
                print(self.url)
            }
        
        
        
    }
    
    
    
    
    func loadUrlWebView() {
        let requestURL = URL(string:url)
        // Place the URL in a URL Request.
        let request = URLRequest(url: requestURL!)
        // Load Request into WebView.
        mapKitView.load(request)
    }
    
    @IBAction func didTapConfirm(_ sender: Any) {
        
    }
    
    
    @IBAction func didTapCancel(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
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
