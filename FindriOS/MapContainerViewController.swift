//
//  MapContainerViewController.swift
//  FindriOS
//
//  Created by Ananya Gupta on 7/24/17.
//  Copyright (c) 2017 Ananya Gupta. All rights reserved.
//

import UIKit
import CoreLocation

class MapContainerViewController: UIViewController, CLLocationManagerDelegate {
    
    override func viewDidLoad() {
//        let arr = NSUserDefaults.standardUserDefaults().objectForKey("foundPlaces")
//        let arr1 = NSUserDefaults.standardUserDefaults().objectForKey("lostPlaces")
//        print(arr)
        print (NSUserDefaults.standardUserDefaults().dictionaryForKey("foundPlaces"))
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.cameraWithLatitude(33.777427, longitude: -84.397609, zoom: 1.0)
        let mapView = GMSMapView.mapWithFrame(CGRect.nullRect, camera: camera)
        view = mapView
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 33.777427, longitude: -84.397609)
//        marker.title = "Atlanta"
//        marker.snippet = "GA"
//        marker.map = mapView
//        
//        let marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2D(latitude: 34.777427, longitude: -84.397609)
//        marker2.title = "second"
//        marker2.snippet = "okay"
//        marker2.map = mapView
        
        let arr = NSUserDefaults.standardUserDefaults().dictionaryForKey("foundPlaces") //objectForKey("foundPlaces")
        for (lats,longs) in arr! {
            
            let nsLat = (lats as! NSString).doubleValue
            let nsLong = (longs as! NSString).doubleValue
            
//            let stringLat = nsLat as String
//            let stringLong = nsLong as String
//            
//            var doubLat = Double(stringLat)
            
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: nsLat, longitude: nsLong)
            marker.title = "Found Item"
            marker.snippet = "\(nsLat)" + " \(nsLong)"
            marker.map = mapView
        }
        
        let arr2 = NSUserDefaults.standardUserDefaults().dictionaryForKey("lostPlaces") //objectForKey("foundPlaces")
        for (lats,longs) in arr2! {
            
            let nsLat = (lats as! NSString).doubleValue
            let nsLong = (longs as! NSString).doubleValue
            
            //            let stringLat = nsLat as String
            //            let stringLong = nsLong as String
            //
            //            var doubLat = Double(stringLat)
            
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: nsLat, longitude: nsLong)
            marker.title = "Lost Item"
            marker.snippet = "\(nsLat)" + " \(nsLong)"
            marker.map = mapView
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
