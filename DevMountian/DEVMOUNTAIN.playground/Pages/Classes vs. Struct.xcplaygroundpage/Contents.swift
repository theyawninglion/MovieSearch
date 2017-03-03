// Classes need an initializer, structs don't.

class House {
    // The blueprints (just the instructions on what a house is)
    let walls: String
    let doors: String
    let windows: String?
    
    
   // initializer. This is the thing that actually makes the house
    
    init(wallsInit: String, doorsInit: String, windowsInit: String?) {
        self.walls = wallsInit
        self.doors = doorsInit
        self.windows = windowsInit
    }
    
}
