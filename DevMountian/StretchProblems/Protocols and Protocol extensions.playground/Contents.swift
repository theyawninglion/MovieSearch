//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle: class{
    var speed: Double {get set}
    var isMoving: Bool {get set}
    func startMoving()
    func stopMoving()
    
    
}

extension Vehicle {
    func startMoving(){
        if !isMoving{
            isMoving = true
            print("starting Moving")
        }
    }
    
    func stopMoving(){
        if isMoving{
            isMoving = false
            print("Stopped Moving")
        }
    }
}


class LawnMower: Vehicle{
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
//    func stopMoving() {
//        if !isMoving{
//            isMoving = false
//            print("Stopping now")
//        }else{
//            print("I've been done for a while")
//        }
//    }
//    func startMoving() {
//        if !isMoving{
//            isMoving = true
//            print("I'm already mowing the lawn")
//        }else{
//            
//            print("I'm just about to start")
//        }
//    }
}

class Truck: Vehicle{
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
    }

Truck(speed: 98, isMoving: false)

