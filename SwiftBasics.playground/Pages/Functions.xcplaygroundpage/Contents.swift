// area calculation for room 1
let length = 10
let width  = 12
let areaOfFirstRoom = length * width

// area calculation for room 2
let secondLength = 14
let secondWidth = 8

let secondArea = secondLength * secondWidth

// area calculation for Room#1
func areaOne() {
    let length = 10
    let width  = 12
    let areaRoom = length * width
    //print(areaRoom)
}
areaOne()


func area(length: Int, width: Int) -> Int {
    let areaOfRoom = length * width
    
    return areaOfRoom
}
area(length: 10, width: 120)
area(length: 15, width: 22)
area(length: 24, width: 88)


func someFunction() -> Void{
    
}

func temperatureInFahrenheit(temperature: Double) -> Double {
    let convertToCelcius = temperature * 9 / 5 + 32
    return convertToCelcius
}

let fahrenheitTemp = temperatureInFahrenheit(temperature: 24)


for shirt: Double in [4, 5, 5.50, 6, 6.50, 7, 7.50,  8.50, 9, 10, 10.50, 11, 13] {
    let costOfShirt = shirt * 2.1
    //print(costOfShirt)
}


for suit: Double in [14, 15, 15.50, 16, 16.50, 17, 17.5, 18, 20, 20.5, 21.50, 22, 22.50, 23, 24.5, 25.5, 26.5, 29.5, 30.5, 31, 31.5, 34.5, 46, 74, 123] {
    let costOfSuit = suit * 3.6
    //print(costOfSuit)
}

func fabric(fabricAmount: Double){
    for cost: Double in [14, 15, 15.50, 16, 16.50, 17, 17.5, 18, 20, 20.5, 21.50, 22, 22.50, 23, 24.5, 25.5, 26.5, 29.5, 30.5, 31, 31.5, 34.5, 46, 74, 123]{
        let total = cost * fabricAmount
        print(total)
    }
    
    
}
//fabric(fabricAmount: 2)
//fabric(fabricAmount: 1.7)
//fabric(fabricAmount: 2.8)


// Argument Labels

func remove(havingValue value: String){
    print(value)
}

remove(havingValue: "A")


func getRemainder(value a:Int, divisor b:Int) -> Int {
    let answer = a % b
    return answer
}
let result = getRemainder(value: 10, divisor: 3)



// Default Values
// Tupels & Naming Return Values
func carpetCostHaving(length: Int, width: Int, carpetColor color: String = "tan") -> (price: Int, carpetColor: String){
    // Gray carpet - $1/sqft
    // Tan carpet - $2/sqft
    // Deep Blue carpet - $4sqft
    
    let areaOfRooom = area(length: length, width: width)
    
    var price = 0
    
    switch color {
    case "gray": price = areaOfRooom * 1
    case "tan": price = areaOfRooom * 2
        case "blue": price = areaOfRooom * 4
    default: price = 0
    }
    return (price, color)
    
}
let results = carpetCostHaving(length: 10, width: 20)
//calling information from the tupel
results.1
results.0
results.price
results.carpetColor



// Scope

func arrayModifier(array:[Int]){
    var arrayOfInts = array
    arrayOfInts.append(5)
    
    var secondArray = arrayOfInts
}

var arrayOfInts = [1, 2, 3, 4]
arrayModifier(array: arrayOfInts)
arrayOfInts

func someFunction (_ test: Int){}

someFunction(1)

func coordinates (for location: String) -> (Double, Double) {
    
    var lat: Double = 0
    switch location {
    case "Eiffel Tower": lat =  48.8582
    case "Great Pyramid": lat = 29.9792
    case "Sydney Opera House": lat = 33.8587
    default: lat = 0
    }
    var lon: Double = 0
    switch location {
    case "Eiffel Tower": lon = 2.2945
    case "Great Pyramid": lon = 31.1344
    case "Sydney Opera House": lon = 151.2140
    default: lon = 0
    }
    
    return (lat,lon)
}

coordinates(for: "Eiffel Tower")





