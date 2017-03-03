//: Playground - noun: a place where people can play

import UIKit

let numbersArray = [12,44,6,99,333,223,45,67,34,26]
numbersArray.count

func turnary(numbers: [Int]){
    
    var previousNumber: Int = 0
    for number in numbers{
        
        var printStatement: String = ""
        
        printStatement += number < 50 ? "low, " : "High, "
        printStatement += number % 13 == 0 ? "didn't learn this one in school, " : "that's easy, "
        printStatement += number > previousNumber ? "getting bigger " : "it's stopped growing "
        previousNumber = number
       
        print(printStatement)
    }
}
turnary(numbers: [9,77,89,999,26,92,52,89,22])


func checkForNil(optionalNumber: Int?) -> Int{
//    if let unwrappedNumber  = optionalNumber{
//        return unwrappedNumber
//    }else{
//        return 0
//    }
    return optionalNumber ?? 0
}