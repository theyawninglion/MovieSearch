//
//  Timer.swift
//  NapTime
//
//  Created by Taylor Phillips on 2/7/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    //MARK: - Properties
    
    var timeRemaining: TimeInterval?
    var isOn: Bool{
        return timeRemaining != nil
    }
    
    weak var delegate: TimerDelegate?
    var timeAsString: String {
        let timeRemaining = Int(self.timeRemaining ?? 20 * 60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - ( minutesLeft * 60)
        return String(format: "%02d:%02d", arguments: [minutesLeft, secondsLeft])
    }
    
    //MARK: - Public Methods
    

   func startTimer(_ time: TimeInterval)   {
        if !isOn{
            timeRemaining = time
            perform(#selector(Timer.secondTick), with: nil, afterDelay: 1)
        }
    }
    
    func stopTimer(){
        if isOn{
            timeRemaining = nil
            delegate?.timerDidStop()
        }
    }
    
    
    //MARK: - Private Methods
    @objc private func secondTick() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0{
            self.timeRemaining = timeRemaining - 1
            perform(#selector(Timer.secondTick), with: nil, afterDelay:1)
            delegate?.timerDidTick()
        }else {
            self.timeRemaining = nil
            delegate?.timerDidComplete()
        }
    }
    
}

protocol TimerDelegate: class {
    func timerDidTick()
    func timerDidComplete()
    func timerDidStop()
}
