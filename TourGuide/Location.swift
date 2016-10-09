//
//  Location.swift
//  TourGuide
//
//  Created by Lauren Nicole Roth on 10/8/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Location {

  var latitude : Double?
  var longitude: Double?
  var address : String?
  var district : Int?
  
//  init(locationJSON : JSON) {
//    self.latitude = locationJSON["latitude"].doubleValue
//    self.longitude = locationJSON["longitude"].doubleValue
//    self.address = locationJSON["address"].stringValue
//    self.district = locationJSON["district"].intValue
//  }
  
  init(latitude: Double?, longitude: Double?, address: String?, district: Int?) {
    self.latitude = latitude
    self.longitude = longitude
    self.address = address
    self.district = district
  }
  
}
