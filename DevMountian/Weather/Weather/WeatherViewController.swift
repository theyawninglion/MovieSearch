//
//  WeatherViewController.swift
//  Weather
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else {return}
        WeatherController.searchWeather(forZipcode: searchTerm) { (weather) in
            guard let weather = weather else {return}
            self.updateViews(weather: weather)
            
        }
        searchBar.resignFirstResponder()
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    func updateViews(weather: Weather){
        DispatchQueue.main.async {
            
            self.nameLabel.text = weather.name
            self.tempLabel.text = "\(weather.temp)"
            self.discriptionLabel.text = weather.description
            
        }
    }

}
