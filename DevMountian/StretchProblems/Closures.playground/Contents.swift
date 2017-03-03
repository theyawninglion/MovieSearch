//: Playground - noun: a place where people can play

import UIKit

var numbers = [11,23,43,44,59,43,88,92,58,11,13,14,12,14,15]

let filterBy3 = numbers.filter({$0 % 3 == 0})
print(filterBy3)

//this reduce is going to start from the first play in the numbers array
let largestNumber = numbers.reduce(numbers[0]){
    if $1 < $0 {
        return $0
    }else{
        return $1
    }
}

print(largestNumber)

//this reduce is going to start from the number 0 and compair all the numbers in the numbers array to 0
let smallestNumber = numbers.reduce(0){
    if $1 > $0 {
        return $0
    }else{
        return $1
    }
}
print(smallestNumber)

var iLoveString = ["I","love","DevMountain"]

var reduceArray = iLoveString.reduce("") {$0 + " " + $1}
reduceArray.remove(at: reduceArray.startIndex)
print(reduceArray)

let join = iLoveString.joined(separator: ",")
print(join)