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
    
    var s_user: PFUser!
    
    var location: String!
    var window: UIWindow!
    
    override func viewDidLoad() {
        
        confirmButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
        confirmButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        cancelButton.layer.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0, alpha: 0.9).cgColor
        cancelButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                self.performPostCompletion()
            }
            else{
                print("Location service disabled");
            }
        
            performPostCompletion()
        
        performUrlOperation()
    }

    
        

    func performPostCompletion() {
        let user = s_user
        let id = user?.objectId!

        let object = PFObject(withoutDataWithClassName: "Post", objectId: id)
        object["completed"] = "true"
        object.saveInBackground { (success: Bool, error: Error?) in
            if success {
                print("saved completion")
                
            } else {
                print("Error")
            }
        }
    }
    
//    func postImageToParse(image: UIImage) {
//
//        if image != nil {
//            MBProgressHUD.showAdded(to: self.view, animated: true)
//            //post image to parse
//            print("post Image to parse")
//            //
//            let id = user.objectId!
//            let object = PFObject(withoutDataWithClassName: "_User", objectId: id)
//            object["profile_img"] = getPFFileFromImage(image: image)
//            object.saveInBackground(block: { (success: Bool, error: Error?) in
//                if success {
//                    print("saved image")
//                    MBProgressHUD.hide(for: self.view, animated: true)
//                } else {
//                    print("Error")
//                }
//            })
//
//
//        }
//    }
//
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
            geocoder.geocodeAddressString(location) {
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
        
        // view controller currently being set in Storyboard as default will be overridden
        self.navigationController?.popViewController(animated: true)
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
