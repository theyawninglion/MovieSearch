//
//  RandomCardViewController.swift
//  DeckOfOneCard
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class RandomCardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        CardController.draw(cards: 1) { (cards) in
            guard let card = cards.first else {return}
            ImageController.image(forURL: card.imageURL , completion: { (image) in
                guard let image = image else { return }
                self.cardImageView.image = image
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
