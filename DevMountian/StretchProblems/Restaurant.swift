//
//  Restaurant.swift
//  
//
//  Created by Taylor Phillips on 2/28/17.
//
//
//
//import Foundation
//
//class Restaurant {
//    
//    var reviews: [Review] = []
//    
////    var hastags: reviews {
////        
////    }
//    
//    let name: String
//    let streetAddress: String
//    let city: String
//    let state: String
//    let reviews: String
//    
//    init(name: String, streetAddress: String, city: String, state: String, reviews: String){
//        self.name = name
//        self.streetAddress = streetAddress
//        self.city = city
//        self.state = state
//        self.reviews = reviews
//    }
//}
//
//extension Restaurant {
//    var hastags: [String] {
//        var hashtagArray = [String]()
//        for review in reviews {
//            let words = review.text.components(separatedBy: " ")
//            for word in words {
//                if word.contains("#") {
//                    hashtagArray.append(word.lowercased())
//                }
//            }
//        }
//        return hashtagArray
//    }
//}
//
//protocol  SearchableObject {
//    func matchesSearchTerm(searchTerm: String)
//}
//
//extension Restaurant: SearchableObject {
//    func matchesSearchTerm(searchTerm: String) {

import UIKit

struct Restaurant {
    
    let name: String
    let reviews: [Review]
}

struct Review {
    
    let username: String
    let text: String
}

let someReviews = [
    Review(username: "BigFatDude1989", text: "This place was the dopest. #best hangout ever"),
    Review(username: "SomeSkinnyChick1313", text: "Their croutons are SO fattening! #calories"),
    Review(username: "ANicPerson", text: "I dunno, I kinda like pizza, but this was only okay. #getbetter"),
    Review(username: "H8rOfGoodFood", text: "It was my favorite place ever. #burntcrust"),
    Review(username: "RockyBilboa", text: "#Adrian!"),
    Review(username: "MrFreeze", text: "I like #hotpockets better. #cookedinamicrowave")
]

let someRestaurants = [
    Restaurant(name: "Some Pizza Place", reviews: [someReviews[0], someReviews[1]]),
    Restaurant(name: "Burgers R Us", reviews: [someReviews[2], someReviews[3]]),
    Restaurant(name: "WatWich", reviews: [someReviews[4], someReviews[5]]),
]

extension Restaurant {
    var hashtags: [String] {
        var hashtagArray = [String]()
        for review in reviews {
            let words = review.text.components(separatedBy: " ")
            for word in words {
                if word.contains("#") {
                    hashtagArray.append(word.lowercased())
                }
            }
        }
        return hashtagArray
    }
}

print(someRestaurants[0].hashtags)
print(someRestaurants[1].hashtags)
print(someRestaurants[2].hashtags)

protocol SearchableObject {
    func matchesSearchTerm(searchTerm: String)
}

extension Restaurant: SearchableObject {
    func matchesSearchTerm(searchTerm: String) {
        let reviewsThatMatchByUsername = self.reviews.filter { $0.username.contains(searchTerm) }
        let reviewsThatMatchByText = self.reviews.filter { $0.text.contains(searchTerm) }
        if self.name.contains(searchTerm) {
            print(self.name)
        } else if reviewsThatMatchByUsername.count > 0 {
            print(self.name)
        } else if reviewsThatMatchByText.count > 0 {
            print(self.name)
        } else {
            print("No match")
        }
    }
}

extension Review: SearchableObject {
    func matchesSearchTerm(searchTerm: String) {
        if self.username.contains(searchTerm) {
            print(username)
        } else if self.text.contains(searchTerm) {
            print(username)
        } else {
            print("No match")
        }
    }
}

someRestaurants[0].matchesSearchTerm(searchTerm: "fat")
someRestaurants[1].matchesSearchTerm(searchTerm: "Burgers")
