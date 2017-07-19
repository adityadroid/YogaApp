//
//  GradientButton.swift
//  WeatherApp
//
//  Created by Aditya Gurjar on 6/12/17.
//  Copyright © 2017 Aditya Gurjar. All rights reserved.
//

import UIKit
@IBDesignable class GradientButton : UIButton{
    
    
    
    @IBInspectable var topColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    @IBInspectable var middleColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    @IBInspectable var bottomColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    
    @IBInspectable var topAlpha : CGFloat = 1.0
    @IBInspectable var middleAlpha : CGFloat = 1.0
    @IBInspectable var bottomAlpha : CGFloat = 1.0
    
    @IBInspectable var cornerSize : CGFloat = 0
    @IBInspectable var borderSize : CGFloat = 0
    @IBInspectable var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    @IBInspectable var borderAlpha : CGFloat = 1.0
    
    
    let maskLayer1 = CAShapeLayer()
    
    
    let gradient = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        
        
        let maskPath1 = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPath1.cgPath
        
        
        
        
        self.layer.mask = maskLayer1
        
        
        gradient.frame = self.bounds
        
        gradient.colors = [topColor.cgColor,bottomColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)

        
        
        
        
//        
//        self.layer.cornerRadius = cornerSize
//        self.layer.borderColor = borderColor.withAlphaComponent(borderAlpha).cgColor
//        self.layer.borderWidth = borderSize
//        self.layer.masksToBounds = true
//        
//        let gradientLayer = CAGradientLayer()
//        
//        gradientLayer.frame = rect
//        
//        let c1 = bottomColor.withAlphaComponent(bottomAlpha).cgColor
//        let c2 = middleColor.withAlphaComponent(middleAlpha).cgColor
//        let c3 = topColor.withAlphaComponent(topAlpha).cgColor
//        
//        gradientLayer.colors = [c3,c2,c1]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//        self.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
    }
    
    
    
}
