//
//  SuperheroModel.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import Foundation


struct superheroData: Codable{
    var superheroes: [superheroes]
}

struct superheroes: Codable {
    
    var name: String?
    var photo: String?
    var realName: String?
    var height: String?
    var power: String?
    var abilities: String?
    var groups: String?
}


