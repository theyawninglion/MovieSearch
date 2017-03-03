//: [Previous](@previous)

import Foundation

class Restaurant {
    
    var reviews = [Review]
    
    let name: String
    let streetAddress: String
    let city: String
    let state: String
    let reviews: String
    
    init(name: String, streetAddress: String, city: String, state: String, reviews: String){
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.reviews = reviews
    }
}

//: [Next](@next)
