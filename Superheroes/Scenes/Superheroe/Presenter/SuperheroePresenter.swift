//
//  SuperheroePresenter.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

protocol SuperheroDelegate: NSObjectProtocol {
    func displaySuperheroData(superheroeData:[superheroes])
    func displayError(with error:Error)
}

class SuperheroePresenter {
    
     //MARK: - Variables

    private let superheroService: APIService
    weak open var delegate : SuperheroDelegate?
    
    
    init(superheroService:APIService){
        self.superheroService = superheroService
    }
    
    //MARK: - Funtions
    
    /**
            Function that make a superhero request and call a delegate with response
     */
    func fetchData() {
        
        if let superHeroeData = superheroService as? SuperheroeService {
            
            let path = "bins/bvyob"
            superHeroeData.fetch(path: path) { [weak self] (infoDowloaded) in
                
                switch infoDowloaded {
                    
                case .success(let superheroData):
                    self?.delegate?.displaySuperheroData(superheroeData: superheroData.superheroes)
                    
                case .error(let error):
                    self?.delegate?.displayError(with: error)
                    
                }
            }
        }
        
    }
    
}
