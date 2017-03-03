//: Playground - noun: a place where people can play

import UIKit

func printNumber(number: Int){
    var line1 = ""
    var line2 = ""
    var line3 = ""
    var line4 = ""
    var line5 = ""
    
    
    
    let shorDash = " -   "
    let solidDash = " --- "
    let leftSideLine = "|    "
    let doubleSideLine = "|   |"
    let rightSideLine = "    |"
    let middleDash = "  |  "
    
    let numberString = String(number)
    
    
    
    for character in numberString.characters{
        switch character{
        case "0":
            line1 += solidDash
            line2 += doubleSideLine
            line3 += doubleSideLine
            line4 += doubleSideLine
            line5 += solidDash
        case "1":
            line1 += shorDash
            line2 += middleDash
            line3 += middleDash
            line4 += middleDash
            line5 += solidDash
        case "2":
            line1 += solidDash
            line2 += rightSideLine
            line3 += solidDash
            line4 += leftSideLine
            line5 += solidDash
        case "3":
            line1 += solidDash
            line2 += rightSideLine
            line3 += solidDash
            line4 += rightSideLine
            line5 += solidDash
        case "4":
            line1 += doubleSideLine
            line2 += doubleSideLine
            line3 += solidDash
            line4 += rightSideLine
            line5 += rightSideLine
        case "5":
            line1 += solidDash
            line2 += leftSideLine
            line3 += solidDash
            line4 += rightSideLine
            line5 += solidDash
        case "6":
            line1 += leftSideLine
            line2 += leftSideLine
            line3 += solidDash
            line4 += doubleSideLine
            line5 += solidDash
        case "7":
            line1 += solidDash
            line2 += rightSideLine
            line3 += rightSideLine
            line4 += rightSideLine
            line5 += rightSideLine
        case "8":
            line1 += solidDash
            line2 += doubleSideLine
            line3 += solidDash
            line4 += doubleSideLine
            line5 += solidDash
        case "9":
            line1 += solidDash
            line2 += doubleSideLine
            line3 += solidDash
            line4 += rightSideLine
            line5 += solidDash
     
        default:
            break
        }
    }
    print(line1)
    print(line2)
    print(line3)
    print(line4)
    print(line5)
}
printNumber(number: 1234567890)

