//
//  SuperheroeService.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import Foundation

class SuperheroeService: APIService {
    
    var url: String {
        return "https://api.myjson.com/"
    }

    func fetch(path: String, completion: @escaping (structEither<superheroData>) -> Void) {
  
        guard let finalUrl = URL(string: url + path) else {return}

        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        get(with: request, completion: completion)
    }
}


