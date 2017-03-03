//: Playground - noun: a place where people can play

import UIKit

//GETTERS AND SETTERS

var currentYear = 2017
struct Person{
    let firstName: String
    let lastName: String
    var yearBorn: Int
    
    var age: Int{
        get{
            return currentYear - yearBorn
        }
        set(newAge){
            yearBorn = currentYear - newAge
        }
    }

}

let aPerson = Person(firstName: "Taylor", lastName: "Phillips", yearBorn: 1990)

print (aPerson.yearBorn)
print ("\(aPerson.firstName) \(aPerson.lastName)")

print (aPerson.age)

currentYear = 1883
aPerson.age
print(aPerson.age)
aPerson.yearBorn
currentYear = 2077
aPerson.yearBorn


