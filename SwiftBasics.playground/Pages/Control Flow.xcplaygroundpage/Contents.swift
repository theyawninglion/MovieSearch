var todo: [String] = ["Finish collections course", "Buy groceries", "Respond to emails", "Pick up dry cleaning", "Order books online", "Mow the lawn"]



for task in todo {
    print(task)
}

// Ranges

for number in 1...10 {
    print("\(number) times 5 is equal to \(number * 5)")
}
var results: [Int] = []
for multiplier in 1...10 {
     results.append(multiplier * 6)
}

// While Loop

var x = 0

while x <= 20{
    print (x)
    x += 1
    
}

var index = 0

while index < todo.count{
    print(todo[index])
    index += 1
    
}

// Repeat While

var counters = 1

while counters < 1 {
    print("I'm inside the while loop")
    counters += 1
}

repeat {
    print ("Im inside the repeat loop!")
    counters += 1
} while counters < 1

let numbers = [2,8,1,16,4,3,9]
var sum = 0
var counter = 0
numbers[0 + 1]
numbers.count


while counter < numbers.count{
    
    let newValue = numbers[counter]
    sum += newValue
    counter += 1
}

// If Statements

var temperature = 9

if temperature < 11 {
    print ("It's getting cold. Lets get that jacket out.")
}
else if temperature < 18 {
    print ("It's getting chilly. I recommend wearing a light seater")
}
else {
    print ("It feels great outside! A t-shirt will do.")
}

// Logical Operators

if temperature > 7 && temperature < 12 {
    print("Might want to wear a scarf")
}

var isSnowing = false
var isRaining = true

if isRaining || isSnowing {
    print("Get out those boots!")
}

if !isRaining {
    print("Yay the sun is out")
}

if isRaining && isSnowing && temperature < 2 {
    print("Put some gloves on!")
}
if (isRaining || isSnowing) && temperature < 2 {
    print("Deffinitly get the gloves out!")
}

var result: [Int] = []

for n in 1...100 {
    let even = n % 2 == 0
    let seven = n % 7 == 0
    
    if  !even == true && seven == true {
        result.append(n)
    }
}


// Switch Statement

let airportCodes = ["LGA", "LHR", "CDG", "HKG", "DXB", "LGW", "JFK", "ORY"]

for airportCode in airportCodes {
   
    switch airportCode {
    case "LGA", "JFK": print("New York")
    case "LHR", "LGW": print("London")
    case "CDG", "ORY": print("Paris")
    case "HKG": print("Hong Kong")
    default: print("I don't know which city that airport is in!")
    }
}

import GameKit

let randomTemperature = GKRandomSource.sharedRandom().nextInt(upperBound: 150)

switch randomTemperature {
case 0..<32: print("Forget clothes, you are basically a popsicle")
case 32..<45: print("It's quite cold. You'll need a jacket")
case 45..<70: print("It's a bit chilly. I recommend wearing a light sweater")
case 70...100: print("It's quite hot! T-shirt weather!")
default: print("Don't even bother to go out!")
}















