// traditional way to store information
let x1 = 0
let y1 = 0

// function way to store information as a tuple
let coordinate1: (x: Int, y: Int) = (0,0)
coordinate1.x

//Object oriented way to store information as an object
struct Point{
    
    let x: Int
    let y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
    
    /// Returns the surrounding point in range of 
    /// the current one
    func points(inRange range: Int = 1) -> [Point]{
        
        var results: [Point] = []
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange{
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange{
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        
        return results
        
    }
}


let coordinatePoint = Point(x: 0, y: 0)

coordinatePoint.x
coordinatePoint.points()

let coordinatePoint2 = Point(x: 2, y: 3)
coordinatePoint2.points()

struct Person {
    
        let firstName: String
        let lastName: String
    
    func fullName()->String{
        return ("\(firstName) \(lastName)")
    }
}

let aPerson = Person(firstName: "Taylor", lastName: "Phillips")
let myFullName = aPerson.fullName()
