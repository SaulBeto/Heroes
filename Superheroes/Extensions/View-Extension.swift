//
//  View-Extension.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit


extension UIView {
    
        enum AnimationKeyPath: String {
         case opacity = "opacity"
     }
    
      /**
       Show an animation on UIViewComponents.
      - Parameters:
          - animation: Kind of animation Type AnimationKeyPath.
          - withDuration:  Time of animation.
      */
    func flash(animation: AnimationKeyPath ,withDuration duration: TimeInterval = 0.5){
        let flash = CABasicAnimation(keyPath: AnimationKeyPath.opacity.rawValue)
        flash.duration = duration
        flash.fromValue = 0.8
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = .infinity
        
        layer.add(flash, forKey: nil)
    }

    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue < 0
        }
    }

    @IBInspectable var shadowColorV: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacityV: Float {
           get {
               return layer.shadowOpacity
           }
           set {
               layer.shadowOpacity = newValue
           }
    }
    
    @IBInspectable var shadowRadiusV: CGFloat {
             get {
                return layer.shadowRadius
             }
             set {
                 layer.shadowRadius = newValue
             }
      }



}
