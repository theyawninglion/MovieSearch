// Collections

//Arrays

var toDo: [String] = ["Finish collections course", "Buy groceris", "Respond to emails"]
var numbers = [1,2,3]


//Add new item to end of array using append method
toDo.append("Pick up dry cleaning")

// Concatenating two arrays

[1,2,3] + [4]

//Conccatenate array containg string literal to todo
toDo = toDo + ["Order book online"]
// Preforming the same operation using the unary addition operator
toDo += ["Order book online"]

// Immutabe Arrays

let secondTaskList = ["Mow the lawn"]

//secondTaskList.append("Pay bills") **Error!**
//secondTaskList += ["someValue"] ** Error!**

// Reading From Arrays

let firstTask = toDo[0]
let thirdTask = toDo[2]

// Modifying Existing Values in an Array
// (Mutating an arrary)

toDo[4] = "Brush teeth"
toDo[0] = "Watch Treehouse content"


// Insert Using Indexes
toDo
toDo.insert("Watch TV", at: 2)

// Removing Items from Arrays
toDo
toDo.remove(at: 2)
toDo

// Counting items in an array

toDo.count
toDo[0]
toDo[5]

// toDo[6] CRASH! Don't ask for values outside the array size.
// Dealing with Non Existent Data

var arrayOfInts = [56, 23, 2, 1, 4, 5]
arrayOfInts.append(6)
arrayOfInts += [7]

let value = arrayOfInts[4]
let discardedValue = arrayOfInts.remove(at: 5)

// Dealing with Non Existent Data



// DICTIONARIES

/*
        Airport Code (key)      Airport Name (Value)
 
        LGA                     La Guardia
        LHR                     Hearthrow
        CDG                     Charles de Gaulle
        HKG                     Hong Kong International
        DXB                     Dubai International
 
*/

var airportCodes = ["LGA": "La Guardia",
                    "LHR": "Heathrow",
                    "CDG": "Charles De Gaulle",
                    "HKG": "Hong Kong International",
                    "DXB": "Dubai International"]

let currentWeather = ["temperature": 75.0]

// Reading from a dictionary

airportCodes["LGA"]
airportCodes["HKG"]

// Inserting Key Value Pairs

airportCodes["SYD"] = "Sydney Airport"
airportCodes["LGA"] = "La Guaardia International Airport"

airportCodes.updateValue("Dublin Airport", forKey: "DUB")

// Removing Key Value Pairs

airportCodes["DXB"] = nil
airportCodes.removeValue(forKey: "CDG")

// Dealing with Non Existent Data

let newYorkAirport  = airportCodes["LGA"]
let orlandoAirport = airportCodes["MCO"]


var iceCream = ["CC": "Chocolate Chip", "AP": "Apple Pie", "PB": "Peanut Butter"]
iceCream["RR"] = "Rocky Road"
let applePie = iceCream["AP"]
iceCream["CC"] = "Chocolate Chip Cookie Dough"



