//
//  LightsaberViewController.swift
//  Starwars
//
//  Created by Taylor Phillips on 2/26/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import AVFoundation

class LightsaberViewController: UIViewController {

    var lightsaberSound = AVAudioPlayer()
    
    @IBAction func lightsaberButtonTapped(_ sender: Any) {
        lightsaberSound.play()
        Thread.sleep(forTimeInterval: 0.5)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            lightsaberSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "LightsaberTurnOn", ofType: "mp3")!))
            
        } catch {
            print("couldn't find lightsaberSound.mp3 \(error.localizedDescription)")
        }

        // Do any additional setup after loading the view.
    }

  

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       
    }
 

}
