//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let lightOn = true
let lightOff = !lightOn

var gameScore = 0
gameScore += 1

let youWin = gameScore >= 999
let niceTry = !youWin

let a = 9
let b = 9889
let c = 2
let d = 5


var results: [Int] = []

for n in 1...100 {
    let even = n % 2 == 0
    let seven = n % 7 == 0
    if  !even == true && seven == true {
        results.append(n)
            }
}

var europeanCapitals: [String] = []
var asianCapitals: [String] = []
var otherCapitals: [String] = []

let world = [
    "BEL": "Brussels",
    "LIE": "Vaduz",
    "BGR": "Sofia",
    "USA": "Washington D.C.",
    "MEX": "Mexico City",
    "BRA": "Brasilia",
    "IND": "New Delhi",
    "VNM": "Hanoi"]

for (key, value) in world {
    switch key {
    case "BEL", "LIE", "BGR": europeanCapitals.append(value)
    case "IND","VNM": asianCapitals.append(value)
    default: otherCapitals.append(value)
    }
}


for n in 1...100 {
    let three = n % 3 == 0
    let five = n % 5 == 0
    
    if three == true && five == true {
        print ("FizzBuzz")
    }
    else if three == true {
        print("Fizz")
    }
    else if five == true {
        print("Buzz")
    }
    else {
        print(n)
    }
}

struct Tag {
    let name: String
}

struct Post {
    let title: String
    let author: String
    let tag: Tag
    
    //let firstPost = Post(title: <#T##String#>, author: <#T##String#>, tag: <#T##Tag#>)
}

//Structures

struct User {
    let name: String
    let age: Int

}

struct Book {
    let title: String
    let author: String
    let price: Double
}

let myBook = Book(title: "Animal Farm", author: "George Orwell", price: 6.00)

struct Person {
    let firstName: String
    let lastName: String
    
    func fullName() -> String {
        
    }
}


