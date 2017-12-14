//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Mateus Marques on 13/12/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
    }

}
