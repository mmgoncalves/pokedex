//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mateus Marques on 07/12/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvo: String!
    private var _pokemonURL: String!
    
    init(name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL, method: .get).responseJSON { (response) in
            if let data = response.data {
                
                do {
                    let jsonPokemon = try JSONDecoder().decode(JSONPokemon.self, from: data)
                    
                    self._name = jsonPokemon.name
                    self._height = String(describing: jsonPokemon.height ?? 0)
                    self._weight = String(describing: jsonPokemon.weight ?? 0)
                    
                    if let types = jsonPokemon.types {
                        var typesCapitalized = [String]()
                        
                        types.forEach({ (type) in
                            typesCapitalized.append(type.type.name.capitalized)
                        })
                        
                        self._type = typesCapitalized.joined(separator: "/")
                    }
                    
                    if let defense = jsonPokemon.stats.filter({ $0.stat.name == "defense" }).first {
                        self._defense = String(describing: defense.base_stat ?? 0)
                    }
                    
                    if let attack = jsonPokemon.stats.filter({ $0.stat.name == "attack" }).first {
                        self._attack = String(describing: attack.base_stat ?? 0)
                    }
                    
                    completed()
                    
                } catch {
                    print("Error to parse json to object: \(error.localizedDescription) ")
                }
            }
        }
    }
}

extension Pokemon {
    var pokedexId: Int {
        return _pokedexId ?? 0
    }
    
    var name: String {
        return _name ?? ""
    }
    
    var weight: String {
        return _weight ?? ""
    }
    
    var height: String {
        return _height ?? ""
    }
    
    var type: String {
        return _type ?? ""
    }
    
    var defense: String {
        return _defense ?? ""
    }
    
    var attack: String {
        return _attack ?? ""
    }
}
