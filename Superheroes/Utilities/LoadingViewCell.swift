//
//  LoadingViewCell.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit


/**
This class creates an information download simulator
 */

class LoadingViewCell: UIView {
    
    var viewCell: UIView!
    var originY: CGFloat = 0
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
         print("denit SofiLoadingView")
      }
      
    
    func setUpView(){
        self.backgroundColor = UIColor.clear
        
        for _ in 1...3{
            viewCell = UIView(frame: CGRect(x: 0,
                                            y: originY,
                                            width: self.frame.width - 40,
                                            height: 125))
            viewCell.backgroundColor        = UIColor.lightGray
            viewCell.clipsToBounds          = true
            viewCell.layer.cornerRadius     = 15
            
            addSubview(viewCell)
            viewCell.flash(animation: .opacity, withDuration: 1.0)

            originY = viewCell.frame.origin.y + viewCell.frame.height + 10
        }
        
    }
    
}
