//
//  SuperheroDetail.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

class SuperheroDetail: UIViewController {
    
    @IBOutlet weak var ivPicture: CustomImageview!
    @IBOutlet weak var lblRealName: UILabel!
    @IBOutlet weak var lblPower: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblAbilities: UILabel!
    @IBOutlet weak var lblGroups: UILabel!
    
    
    var superhero : superheroes!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = superhero.name
        setUpView()
    }
    
    func setUpView(){
               
        guard let imgUrl = superhero.photo  else {return}
        ivPicture.loadImageFromUrl(urlString: imgUrl)
        
        lblRealName.text = superhero.realName
        lblPower.text = superhero.power
        lblHeight.text = superhero.height
        lblAbilities.text = superhero.abilities
        lblGroups.text = superhero.groups
    }
    

}
