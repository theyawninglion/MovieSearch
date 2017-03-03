//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    //crud
    //creat+read
    /*
     Work:
     - create and send request and wait for response
     - Handle error if there is one.hanle what that response returns us (either data or error)
     - Handle data if there is any. Serialize the datat into json object
     - turn json dictiontionaries "instaniate cards dictionary"  into card objects.
     - pass the array of cards along.
     */
    static func draw(cards: Int, completion: @escaping ([Card])  -> Void){
        
        // - create and send request and wait for response

        guard let url = baseURL else {return}
        
        let parameters = ["count":"\(cards)"]
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
           // - Handle error if there is one.hanle what that response returns us (either Data or error)
            if let error  = error{
                print("There was an error performing network request. Error\(error.localizedDescription)" )
                completion([])
            }
            //- Handle data if there is any. Serialize the datat into json object

            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {return completion([])}
            
            guard let jsonDicitionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else {  print("\(responseDataString)"); completion([]); return}
            
            //- turn json dictiontionaries "instaniate cards dictionary"  into card objects.
            guard let cardDictionaries = jsonDicitionary["cards"] as? [[String:Any]] else {return completion([])}
            
            let cards = cardDictionaries.flatMap({Card(dictionary: $0) })
            
            //- pass the array of cards along.
            
            completion(cards)
        }
    }
    
}
