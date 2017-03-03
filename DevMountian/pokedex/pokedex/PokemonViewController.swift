//
//  PokemonViewController.swift
//  pokedex
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import AVFoundation

var auidoPlayer = AVAudioPlayer()
var openingSound = AVAudioPlayer()

class PokemonViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var playbutton: UIButton!
    @IBAction func pauseButtonTapped(_ sender: Any) {
        let playbuttonimage = #imageLiteral(resourceName: "play-icon-solid")
        let pauseButtonimage = #imageLiteral(resourceName: "pause-button-png-6")
        if auidoPlayer.isPlaying{
            auidoPlayer.pause()
            playbutton.setImage(playbuttonimage, for: .normal)
        }else{
            playbutton.setImage(pauseButtonimage, for: .normal)
            auidoPlayer.play()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    //    @IBOutlet weak var moveLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            openingSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "pokeballopeningsoundFX", ofType: "mp3")!))
            auidoPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pokemon Music", ofType: "mp3")!))
        }catch{
            print(error.localizedDescription)
        }
        openingSound.play()
        songDelay(song: auidoPlayer)
        auidoPlayer.play()
        
        searchBar.delegate = self
        nameLabel.text = ""
        weightLabel.text = ""
        heightLabel.text = ""
        expLabel.text = ""
        numberLabel.text = ""
        auidoPlayer.numberOfLoops = -1
    }
    func songDelay(song: AVAudioPlayer){
        Thread.sleep(forTimeInterval: 4)
    }
    
    
    
    //MARK: - searchBar Delegate Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        searchBar.resignFirstResponder()
        
        guard let searchTerm = searchBar.text else { return}
        
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in
            
            guard let pokemon = pokemon else { return }
            
           DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
                self.updateViews(with: pokemon)
            }
            
        }
    }
    
    func updateViews(with pokemon: Pokemon){
        
        imageView.image = pokemon.image
        nameLabel.text = pokemon.name
        weightLabel.text = "\(pokemon.weight) kg"
        heightLabel.text = "\(pokemon.height) m"
        expLabel.text = "\(pokemon.exp)"
        numberLabel.text = "#\(pokemon.id)"
        
    }
    
    
}
