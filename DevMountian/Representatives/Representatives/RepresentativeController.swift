//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ( [Representative]) -> Void){
        
        guard let url = baseURL else { completion([])
            return  }
        
        let parameters = ["state" : state, "output": "json"]
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
            // - Handle error if there is one.hanle what that response returns us (either Data or error)
            if let error = error{
                print("there was an error in the networkcontroller.performrequest.\(error.localizedDescription)")
                completion([])
            }
            
            //- Handle data if there is any. Serialize the datat into json object
            guard let data = data//,
                //let responseDataString = String(data: data, encoding: .utf8)
                else {completion([]); return }
            do{
            
            guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any], let representativeDictionaries = jsonDictionary["results"] as? [[String:Any]] else {
                print("responseDataString")
                completion([])
                return}
            
            //- turn json dictiontionaries "instaniate cards dictionary"  into card objects.

            
            let representative = representativeDictionaries.flatMap{Representative(dictionary: $0)}
            
            //- pass the array of cards along.
            completion(representative)
            }catch{
                print("unable to deserialize json: \(error)")
                completion([])
                return
            }
            
        }
    }
}
