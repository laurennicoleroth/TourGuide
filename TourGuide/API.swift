//
//  API.swift
//  TourGuide
//
//  Created by Lauren Nicole Roth on 10/8/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
  
  static let sharedInstance = API()
  
  let endpoint = "http://blackbeardev.com:3000/"
  
  func locations(district: Int, completion : @escaping ([LocationViewModel]) -> ()) {

//    let urlString = "http://blackbeardev.com:3000/districts/\(district)"
    let urlString = "http://pacific-forest-37623.herokuapp.com/districts/\(district)"

    Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default)
      .downloadProgress() { progress in
        print("Progress downloading routes: \(progress.fractionCompleted)")
      }
      .validate { request, response, data in
        
        print("Request: ", request)
        
        return .success
      }
      .responseJSON { response in
        print("Response is: ", response)
        let json = JSON(data: response.data!)
        
        print("json from the server: \(json)")
        
        completion(self.locationsFromJSON(incomingJSON: json))
    }

  }
  
  func locationsFromJSON(incomingJSON: SwiftyJSON.JSON) -> [LocationViewModel] {
    var locationViewModels: [LocationViewModel] = []
    
    for (_, subJson):(String, JSON) in incomingJSON {
      print("Subjson: ", subJson)
      locationViewModels.append(LocationViewModel(location: Location(locationJSON: subJson)))
    }
    
    print("Location view models count: ", locationViewModels.count)
    return locationViewModels
  }
  
  func locationFromJSON(incomingJSON: SwiftyJSON.JSON) -> LocationViewModel {
    return LocationViewModel(location: Location(locationJSON: incomingJSON))
  }
}
