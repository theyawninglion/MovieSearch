//
//  SurveyController.swift
//  EmojiSurvey
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class SurveyController {
    static let baseURL = URL(string: "https://devmountainschoolwork.firebaseio.com/")
    
    //get
    static func fetchResponses(completion: @escaping ([Survey])->Void){
        
        guard let unwrappedURL = baseURL else { completion([]); return}
        let url = unwrappedURL.appendingPathExtension("json")
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: nil, body: nil) { (data, error) in
            if let error = error{
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:[String:Any]],
                let emojisDictionary = jsonDictionary["emojis"] as? [String:[String:String]]
                else {completion([]); return }
            
            let responses = emojisDictionary.flatMap({Survey(dictionary: $0.value, identifier: $0.key)})
            
            completion(responses)
        }
    }
    // put
    static func putResponseIntoAPI(name: String, favoriteEmoji: String){
        
        //create a survey object
        let survey = Survey(name: name, favoriteEmoji: favoriteEmoji)
        //get URL
        guard let unwrappedURL = baseURL else { return }
        let url = unwrappedURL.appendingPathComponent("emojis").appendingPathComponent(survey.uuid.uuidString) .appendingPathExtension("json")
        //put object into API
        NetworkController.performRequest(for: url, httpMethod: .Put, urlParameters: nil, body: survey.jsonData) { (data, error) in
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {return}
            
            if let error = error{
                print("Error:\(error.localizedDescription)")
                
            }else if responseDataString.contains("error"){
                print("error found in responseDataString\(error?.localizedDescription )")
                
            }else{
            print("successfully put data to endpoint. \nResponse: \(responseDataString)")
            }
        }
    }
}
