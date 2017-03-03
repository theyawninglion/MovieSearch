//: Playground - noun: a place where people can play

import UIKit


struct Person {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
    }
    
}

var person1 = Person(name: "Aaron")

var person2 = person1

person2.name = "David"

print(person1.name)

///////

//Refrense Type

class Student {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
    }
    
}

var student1 = Student(name: "Alex")

var student2 = student1

student2.name = "Taylor"

print(student1.name)


