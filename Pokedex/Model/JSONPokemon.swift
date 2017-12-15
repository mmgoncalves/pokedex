//
//  JSONPokemon.swift
//  Pokedex
//
//  Created by Mateus Marques on 15/12/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct JSONPokemon: Codable {
    var height: Int!
    var weight: Int!
    var name: String!
    var types: [JSONTypes]!
    var stats: [JSONStats]!
}

struct JSONStats: Codable {
    var stat: JSONStat!
    var base_stat: Int!
}

struct JSONStat: Codable {
    var name: String!
}

struct JSONTypes: Codable {
    var slot: Int!
    var type: JSONType!
}

struct JSONType: Codable {
    var name: String!
}
