//
//  ImageView-Extension.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageview: UIImageView {
    var imgUrlString: String?
    
    /**
    Download images from url using cache.
    - Parameters:
        - urlString: The url to download image.
    */
    func loadImageFromUrl(urlString: String){
        
        imgUrlString = urlString
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString){
            self.image = imageFromCache
            return
        }

        DispatchQueue.global(qos: .background).async{ [weak self] in
           
            guard let imageData = try? Data(contentsOf: url!) else {return}
            guard let image = UIImage(data: imageData) else {return}
            
            DispatchQueue.main.async {
                
                if self?.imgUrlString == urlString{
                    self?.image = image
                }
                imageCache.setObject(image, forKey: urlString as NSString)
                
            }
        }
    }
}



extension UIImageView{
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
