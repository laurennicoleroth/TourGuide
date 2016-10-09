//
//  LocationViewModel.swift
//  TourGuide
//
//  Created by Lauren Nicole Roth on 10/8/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import Alamofire
import GoogleMaps

class LocationViewModel {
  private var location: Location
  
  var mapMarker : GMSMarker {

    let position = CLLocationCoordinate2DMake(self.location.latitude!, self.location.longitude!)
    
    let marker = GMSMarker(position: position)
    marker.title = self.location.name
    marker.snippet = self.location.address
    
    return marker
  }
  
  init(location: Location) {
    self.location = location
  }
  
}
