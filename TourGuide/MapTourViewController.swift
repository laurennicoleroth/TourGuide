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
      
      let hotel = GMSCameraPosition.camera(withLatitude: hotelBaltimore.latitude,
                                                       longitude: hotelBaltimore.longitude, zoom: 14)
    
      gmsMapView.camera = hotel

      
      let locations = getLocationsForDistrict()
      
      for location in locations {
        let marker = location.mapMarker
        marker.map = gmsMapView
      }

    }
  
    func getLocationsForDistrict() -> [LocationViewModel] {
      let api = API.sharedInstance
//      api.locations(district: district!) { response in
//        print(response)
//      }
      return api.locations(district: district!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
