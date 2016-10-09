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


//  func locations(district: Int, completion : @escaping ([LocationViewModel]) -> ()) {
  func locations(district: Int) -> [LocationViewModel] {
  
//    let districtRequest = "/districts/\(district)"
//    let urlString = "" + districtRequest
    
//    Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default)
//      .downloadProgress() { progress in
//        print("Progress downloading routes: \(progress.fractionCompleted)")
//      }
//      .validate { request, response, data in
//        
//        return .success
//      }
//      .responseJSON { response in
//        
//        let json = JSON(data: response.data!)
//        
//        print("json from the server: \(json)")
//        
//        completion(self.locationsFromJSON(incomingJSON: json))
//    }

    return [
      LocationViewModel(location: Location(latitude: 48.858731, longitude: 2.2944813, address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France", district: district))
    ]
  }
  
  func locationsFromJSON(incomingJSON: SwiftyJSON.JSON) -> [LocationViewModel] {
    var locationViewModels: [LocationViewModel] = []
    
//    for (_, subJson):(String, JSON) in incomingJSON {
//      locationViewModels.append(LocationViewModel(location: Location(locationJSON: subJson)))
//    }
    
    return locationViewModels
  }
  
//  func locationFromJSON(incomingJSON: SwiftyJSON.JSON) -> LocationViewModel {
//    return LocationViewModel(location: Location(locationJSON: incomingJSON))
//  }
}
