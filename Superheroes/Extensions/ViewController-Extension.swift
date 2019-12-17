//
//  ViewController-Extension.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit


extension UIViewController{
    
    
    /**
     Change background color if dark mode is activated. Just for iOS 13
    */
    func changeBackgroundModeColor(){
        
        if #available(iOS 13.0, *) {
            
            if traitCollection.userInterfaceStyle == .dark{
                self.view.backgroundColor = .black
            }else{
                self.view.backgroundColor = .white
            }
        }
    }
    
    /**
     Show an alert in view with title and message.
    - Parameters:
        - title: Titile of alert.
        - msg:  Message of alert.
    */
    func SHAlertWithTitle(title: String, msg:String)  {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alert, animated: true)
    }
    
    /**
     Show an alert in view with  just a message.
    - Parameters:
        - msg: Message of alert.
    */
    func SHAlert( msg:String)  {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alert, animated: true)
    }

}
