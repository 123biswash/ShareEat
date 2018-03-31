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
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        else{
            print("Location service disabled");
        }
    }
       
        

        // Do any additional setup after loading the view.
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locValue : CLLocationCoordinate2D = manager.location!.coordinate;
        let span2 = MKCoordinateSpanMake(1, 1)
        let long = locValue.longitude;
        let lat = locValue.latitude;
        print(long);
        print(lat);
        //let loadlocation = CLLocationCoordinate2D(
            //latitude: lat, longitude: long
            
       // )
        
        locationManager.stopUpdatingLocation();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    @IBAction func didTapCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func didTapConfirm(_ sender: Any) {
    }
    
    func loadUrlWebView() {
        let requestURL = URL(string:url)
        // Place the URL in a URL Request.
        let request = URLRequest(url: requestURL!)
        // Load Request into WebView.
        mapKitView.load(request)
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
