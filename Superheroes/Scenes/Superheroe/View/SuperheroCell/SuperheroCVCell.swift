//
//  SuperheroCVCell.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

class SuperheroCVCell: UICollectionViewCell {
    
    @IBOutlet weak var ivPicture: CustomImageview!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPower: UILabel!
    
    static let cellIdentifier = "superheroeCell"
    static let xibName = "SuperheroCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds          = true
        self.layer.cornerRadius     = 15
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        ivPicture.image = #imageLiteral(resourceName: "avengers")
    }
    
    /**
       Configure cell with data .
       */
    func configCell(superhero: superheroes){
        
        lblName.text = superhero.name
        lblPower.text = superhero.power
        
        guard let imgUrl = superhero.photo  else {return}
        ivPicture.loadImageFromUrl(urlString: imgUrl)

    }

}
