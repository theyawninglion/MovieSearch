//Protocols


class Car: Equatable {
    
    let year: String
    let make: String
    let model: String
    
    init(year: String, make: String, model: String){
        self.year = year
        self.make = make
        self.model = model
    }
    
    
    func go(){
        print("Vroom, Vroom!")
    }
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.year == rhs.year && lhs.make == rhs.make && lhs.model == rhs.model
    }
}

let car1 = Car(year: "2010", make: "Honda", model: "Civic Si")
let car2 = Car(year: "2001", make: "Toyota", model: "Tacoma")
let car3 = Car(year: "2010", make: "Honda", model: "Civic Si")

if car1 == car3 {
    print("That's the same car.")
} else {
    print("Those are different cars.")
    
}
if car1 == car2 {
    print("That's the same car.")
} else {
    print("Those are different cars.")
    
}
car1 != car2


let workingDictionary: [String : Any] = ["nameKey" : "Derek", "ageKey": 28, "favMovieKey" : "Zoolander"]

let brokenDictionary: [String : Any] = ["nameKey" : "Steve", "ageKey": 2]


class Person{
    
    private let nameKey = "nameKey"
    private let ageKey = "ageKey"
    private let movieKey = "favMovieKey"
    
    let name: String
    let age: Int
    let favoriteMovie: String
    
    
    init(name: String, age: Int, favortieMovie: String){
        
        self.name = name
        self.age = age
        self.favoriteMovie = favortieMovie
    }
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[nameKey] as? String,
            let age = dictionary[ageKey] as? Int,
            let favoriteMovie = dictionary[movieKey] as? String
            else{
                return nil
        }
        
        self.name = name
        self.age = age
        self.favoriteMovie = favoriteMovie
        
    }
}
/*
var dictionaryRepresentation: [String: Any] {
    var songDictionaryArray: [[String: String]] = []
    
    for song in songList{
        let songDictionary = song.dictionaryRepresentation
        songDictionaryArray.append(songDictionary)
    }
    
    let dictiotnary: [String: Any] = [playlistNameKey: playlistName, songListKey: songDictionaryArray]
    
    return dictiotnary
}
*/

func saveToPersistentStore() {
    
    var playlistDictionaryArray: [[String: Any]]  = []
    
    for playlist in playlistsArray {
        let playlistDictionary =  playlist.dictionaryRepresentation
        playlistDictionaryArray.append(playlistDictionary)
        
    }
    UserDefaults.standard.set(playlistDictionaryArray, forKey: playlistsKey)
}

func loadFromPersistentStore(){
    if let playlistDictionaryArray = UserDefaults.standard.object(forKey: playlistsKey) as? [[String: Any]]{
        
        var playlists: [Playlist] = []
        
        for playlistDictionary in playlistDictionaryArray{
            
            if let playlist = Playlist(dictionary: playlistDictionary) {
                playlists.append(playlist)
            }
        }
        
        self.playlistsArray = playlists



