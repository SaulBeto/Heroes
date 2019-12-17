//
//  SuperheroeVC.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

class SuperheroeVC: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var cvSuperheroe: UICollectionView!
    
    //MARK: - Variables
    
    var arrSuperheroData = [superheroes]()
    var superhero : superheroes!
    var idSegue         = "showDetailSuperheroe"
    var viewLoader      = LoadingViewCell()
    let superheroePresenter = SuperheroePresenter(superheroService: SuperheroeService())

    
    //MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Superheroes"
        setUpPresenter()
        setUpCollectionView()
        callService()

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.changeBackgroundModeColor()
    }
    
    
    //MARK: - Funtions
    
    func setUpPresenter(){
        self.superheroePresenter.delegate = self
    }
    
    func setUpCollectionView(){
        cvSuperheroe.register(UINib(nibName: SuperheroCVCell.xibName, bundle: Bundle.main), forCellWithReuseIdentifier: SuperheroCVCell.cellIdentifier)
    }
    
    func callService(){
        
        if !view.subviews.contains(viewLoader){
            viewLoader = LoadingViewCell(frame: cvSuperheroe.frame)
            self.view.addSubview(viewLoader)
        }
        
        superheroePresenter.fetchData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == idSegue else {return}
        
        if let destinationVC = segue.destination as? SuperheroDetail {
            destinationVC.superhero = superhero
        }
    }
    
}



extension SuperheroeVC: SuperheroDelegate{
    
    /**
        Display superhero data retrieved from service
        */
    func displaySuperheroData(superheroeData: [superheroes]) {
        self.viewLoader.removeFromSuperview()
        self.arrSuperheroData = superheroeData
        self.cvSuperheroe.reloadData()
    }
    
    /**
        Display an error if something was wrong with superhero service
        */
    func displayError(with error: Error) {
        DispatchQueue.main.async {
            if self.view.subviews.contains(self.viewLoader){
                self.viewLoader.removeFromSuperview()
                self.SHAlertWithTitle(title: "Error", msg: error.localizedDescription)
            }
        }
    }
}



