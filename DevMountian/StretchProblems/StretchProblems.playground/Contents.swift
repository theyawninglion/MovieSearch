func numbersBetween(x: Int, y: Int){
    for num in 0...y{
        if num % x == 0{
            print(num)
        }
    }
    
    numbersBetween(x: 5, y: 200)
    
    func primes(y: Int){
        for number in 0...y{
            var divisibleCount = 0
            
            for i in 1...number{
                if number % i == 0{
                    divisibleCount += 1
                }
            }
            if divisibleCount <= 2 && number > 1 {
                print(number)
            }
        }
    }
}

/*class Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.age == rhs.age
}

let james = Person(firstName: "James", lastName: "Pacheco", age: 26 )
let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)
let alex = Person(firstName: "Alex", lastName: "Whit", age: 24)
let ben = Person(firstName: "Ben", lastName: "Anderson", age: 33)

let clubMembers: [Person] = [james, andrea, carol, ben]

func areYouAmemberOfTheClub(person: Person)->Bool{
    
    //    return clubMembers.contains(person)
    
    var isMember = false
    
    for member in clubMembers{
        if member == person{
            isMember  = true
            
            
        }
    }
    return isMember
}

func compareInts(x: Int, y: Int) -> Bool {
    if x == y{
        return true
    } else{
        return false
    }
}
*/


import UIKit

let calendar = Calendar.current
let date = Date()
let components  = calendar.dateComponents([.year], from: date)
let currentYear = components.year!

struct Person {
    
    var firstName: String
    var lastName: String
    var yearOfBirth: Int
    
    var age: Int {
        get {
            return currentYear - yearOfBirth
        } set(newAge) {
            self.yearOfBirth = currentYear - newAge
        }
    }
    
    
    
}

protocol Vehicle {
    var speed: Double {get}
    var isMoving: Bool {get}
    
    func startMoving()
    func stopMoving()
}

class LawnMower: Vehicle{
    
    var speed: Double = 22.0
    var isMoving: Bool = true
    func startMoving() {
        if !isMoving{
            isMoving = true
            print ("is moving")
        }else{
            print("is already moving")
        }
        
    }
    func stopMoving() {
        if isMoving{
            isMoving = false
            print("going to stop")
        }else{
            print("already stopped")
        }
    }
    

    
}

class Truck: Vehicle {
    var speed: Double = 22.0
    var isMoving: Bool = true
    
    func startMoving() {
        if !isMoving{
            isMoving = true
            print("This truck is crusing")
        }else{
            print("This truck is getting up to speed")
        }
    }
    
    func stopMoving() {
        if isMoving{
            isMoving = false
            print("I'm trying to slow this bahemeth")
            
        }else{
            print("I've been chilling here for a while now")
        }
        
    }
}












    
