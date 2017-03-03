//
//  WeatherController.swift
//  Weather
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

class WeatherController {
    static let baseURL = URL(string: "http://api.openweathermap.org/data/2.5/weather")
    
    static let apiKey = "4e63f48bb2d090d7fb7d80f6447ace6a"
    
    static func searchWeather(forZipcode zipcode: String, completion: @escaping (Weather?)->Void){
        
        guard let unwrappedURL = baseURL else {completion(nil); return}
        
        let parameters = ["zip": zipcode, "APPID" : apiKey]
        
        NetworkController.performRequest(for: unwrappedURL, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { completion(nil); return}
            
            let weather = Weather(dictionary: jsonDictionary)
            
            
            
            completion(weather)
            
        }
    }
}
