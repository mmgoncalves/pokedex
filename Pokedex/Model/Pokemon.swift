//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mateus Marques on 07/12/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _heiht: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvo: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
    }
}
