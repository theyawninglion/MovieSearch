//: Playground - noun: a place where people can play

import UIKit



let tenIntsArray = [18, 2, 55, 27, 172, 2, 5, 13, 2, 88, 66, 14, 2, 2]
let lowStatement = "Low. "
let highStatement = "High. "
let divisibleBy13Statement = "Didn't learn that one in school. "
let undivisibleBy13Statement = "That's easy. "
let largerThanPreviousNumberStatement = "Getting bigger."
let smallerThanPreviousNumberStatement = "Stopped growing."

func printLowOrHigh(forNumbers numbers: [Int]) {
    var printStatement = ""
    var comparingNumber = 0
    
    for number in numbers {
        if number < 50 {
            printStatement = "\(number) is \(lowStatement)"
        } else {
            printStatement = "\(number) is \(highStatement)"
        }
        
        if number % 13 == 0 {
            printStatement += divisibleBy13Statement
        } else {
            printStatement += undivisibleBy13Statement
        }
        
        if number > comparingNumber {
            printStatement += largerThanPreviousNumberStatement
        } else {
            printStatement += smallerThanPreviousNumberStatement
        }
        
        comparingNumber = number
        print(printStatement)
    }
}

//printLowOrHigh(forNumbers: tenIntsArray)


func printLowOrHighUsingTernary(forNumbers numbers: [Int]) {
    var printStatement = ""
    var comparingNumber = 0
    for number in numbers {
        printStatement = number < 50 ? lowStatement : highStatement
        printStatement += number % 13 == 0 ? divisibleBy13Statement : undivisibleBy13Statement
        printStatement += number > comparingNumber ? largerThanPreviousNumberStatement : smallerThanPreviousNumberStatement
        comparingNumber = number
        print(printStatement)
    }
}

//printLowOrHighUsingTernary(forNumbers: tenIntsArray)


let firstOptional: String? = "Hello, world!"
let secondOptional: String? = nil

//print(firstOptional ?? "It's nil!")
//print(secondOptional ?? "It's nil!")

if firstOptional != nil {
    print(firstOptional!)
} else {
    print("It's nil!")
}

let printStatement = firstOptional ?? "Nothing there."

var printStatement2: String
if firstOptional != nil {
    printStatement2 = firstOptional!
} else {
    printStatement2 = "Nothing there."
}