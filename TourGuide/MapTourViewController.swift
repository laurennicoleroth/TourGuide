//
//  MapTourViewController.swift
//  TourGuide
//
//  Created by Lauren Nicole Roth on 10/8/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit
import GoogleMaps

class MapTourViewController: UIViewController, GMSMapViewDelegate {

    let hotelBaltimore = CLLocationCoordinate2DMake(48.866434, 2.289143)
    var district : Int?
    @IBOutlet weak var gmsMapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        getLocationsForDistrict()

    }
  
    func getLocationsForDistrict() {
      let api = API.sharedInstance
      api.locations(district: district!) { response in
        print("Response from api: ", response)
        
        if response.count < 1 {
          print("DIE")
        } else {
        
        let start = GMSCameraPosition.camera(withLatitude: (response.first?.latitude)!,
                                 longitude: (response.first?.longitude)!, zoom: 14)
        
        self.gmsMapView.camera = start
        
          for location in response {
            print("Drawing marker for location: ", location.mapMarker)
            let marker = location.mapMarker
            marker.map = self.gmsMapView
          }
        }
      }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
