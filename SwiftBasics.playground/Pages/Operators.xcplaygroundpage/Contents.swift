//Binary Operators

let height: Double = 12 // in feet
let width: Double = 10 // in feet
let area = height * width // area in sq ft

// 1 sq meter = 1 sq ft / 10.764

let areaInMeters = area/10.764

// Equals Operator (Note: Different from assignment operator)

let string1 =  "Hello!"
let string2 = "Hello!"
let string3 = "Hello"

string1 == string2
string1 == string3

// Not equal

string1 != string2
string1 != string3

//Greater than

1 > 2
2 > 1

"a" > "b"

"A" > "a"

let someOperation = 20 + 400 % 10 / 2 - 15
let anotherOperation = 52 * 27 % 200 / 2 + 5

someOperation > anotherOperation
someOperation == anotherOperation
someOperation < anotherOperation

let isGreater = someOperation >= anotherOperation

/*
 --------
 Operator Precedence
 */

var x = 100 + 100 - 5 * 2 / 3 % 7

// Unary Operators

var levelScore = 0
//levelScore = levelScore + 1

levelScore += 1
levelScore -= 1

// NOT operator

let on = true
let off = !on


var initialScore = 8
initialScore += 1


let isWinner = initialScore <= 9
let losser = !isWinner





















