//
//  ViewController.swift
//  30May2017
//
//  Created by Aditya Gurjar on 5/30/17.
//  Copyright © 2017 Aditya Gurjar. All rights reserved.
//

import UIKit
//
//extension UIButton{
//    func roundedButton(top : UIColor, bottom : UIColor){
//        let maskPath1 = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
//        let maskLayer1 = CAShapeLayer()
//        maskLayer1.frame = self.bounds
//        maskLayer1.path = maskPath1.cgPath
//        self.layer.mask = maskLayer1
//        
//        
//        let gradient = CAGradientLayer()
//        gradient.frame = self.bounds
//
//        gradient.colors = [top.cgColor,bottom.cgColor]
//        
//        self.layer.insertSublayer(gradient, at: 0)
//    }
//   
//    
//}
class CustomButton : UIButton{
    
    let maskLayer1 = CAShapeLayer()
    
    
    let gradient = CAGradientLayer()

    func roundedButton(top : UIColor, bottom : UIColor){
        
            let maskPath1 = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
            maskLayer1.frame = self.bounds
            maskLayer1.path = maskPath1.cgPath
        
        
        
        
            self.layer.mask = maskLayer1
            
            
            gradient.frame = self.bounds
            
            gradient.colors = [top.cgColor,bottom.cgColor]
            
            self.layer.insertSublayer(gradient, at: 0)
        }
    
    
    override func draw(_ rect: CGRect) {
        
        
    }
    
}

class ViewController: UIViewController {
    
    
    
    let images = [UIImage(named:"yoga1.jpg"),UIImage(named:"yoga2.jpg"),UIImage(named:"yoga3.jpg"),UIImage(named:"yoga5.jpg"),UIImage(named:"yoga10.jpg"),UIImage(named:"yoga11.jpg"),UIImage(named:"yoga8.gif"),UIImage(named:"yoga9.jpg")]
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var b1: GradientButton!
    @IBOutlet weak var b2: GradientButton!
    @IBOutlet weak var b3: GradientButton!
    @IBOutlet weak var b4: GradientButton!
    @IBOutlet weak var b5: GradientButton!
    @IBOutlet weak var b6: GradientButton!
    @IBOutlet weak var bottomMarqueeLabel: UILabel!
    
    @IBOutlet weak var topImageView: UIImageView!
    var currentImage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        //making the buttons round
//        b1.roundedButton(top: hexStringToUIColor(hex: "#F44600") , bottom: hexStringToUIColor(hex:  "#CB4400"))
//         b2.roundedButton(top: hexStringToUIColor(hex: "#094599") , bottom: hexStringToUIColor(hex:  "#001628"))
//         b3.roundedButton(top: hexStringToUIColor(hex: "#008423") , bottom: hexStringToUIColor(hex:  "#003110"))
//         b4.roundedButton(top: hexStringToUIColor(hex: "#CC5D00") , bottom: hexStringToUIColor(hex:  "#7E3300"))
//         b5.roundedButton(top: hexStringToUIColor(hex: "#630028") , bottom: hexStringToUIColor(hex:  "#7D0031"))
//         b6.roundedButton(top: hexStringToUIColor(hex: "#830013") , bottom: hexStringToUIColor(hex:  "#380000"))
////        
//        b2.roundedButton()
//        b3.roundedButton()
//        b4.roundedButton()
//        b5.roundedButton()
//        b6.roundedButton()
        
        
        //making the text scroll
        UIView.animate(withDuration: 15.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
            self.bottomMarqueeLabel.center = CGPoint(x: 0 - self.bottomMarqueeLabel.bounds.size.width / 2, y: self.bottomMarqueeLabel.center.y)
        }, completion:  { _ in })
        
        
        
        playerView.isHidden = true
        //playerView.load(withVideoId: "M7lc1UVf-VE")
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.switchImage), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func switchImage(){
        
        if(currentImage<images.count-1){
            currentImage = currentImage+1
            
        }else{
            
            currentImage=0
        }
        UIView.transition(with: topImageView, duration: 1, options: .transitionCrossDissolve, animations: {self.topImageView.image = self.images[self.currentImage]}, completion: nil)
        
    }
    
    @IBAction func aboutYogaDay(_ sender: GradientButton) {
    
        startVideoWithID(id: "gpnkE0TIihI")
    }
    @IBAction func aboutYoga(_ sender: GradientButton) {
        startVideoWithID(id: "36Q3V7WY3F0")

    }
    
    @IBAction func yogaPartA(_ sender: GradientButton) {
        startVideoWithID(id: "ecO48Pdlhg8")

    }
    
    @IBAction func yogaPartB(_ sender: GradientButton) {
        startVideoWithID(id: "YgZut0aBDng")

    }
    
    @IBAction func yogaPartC(_ sender: GradientButton) {
        startVideoWithID(id: "0ly2Sq03yxY")

    }
    @IBAction func yogaPartD(_ sender: GradientButton) {
        startVideoWithID(id: "1ipF3zZ0jwc")

        
    }
    
   
    func startVideoWithID( id : String){
        
        playerView.isHidden = false
        topImageView.isHidden = true
//        let laodid = id + "&controls=0"
        
        playerView.load(withVideoId: id)
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   
    
    override func viewDidLayoutSubviews() {
         b1.contentMode = .redraw
        b2.contentMode = .redraw
        b3.contentMode = .redraw
        b4.contentMode = .redraw
        b5.contentMode = .redraw
        b6.contentMode = .redraw
        
        
    }
}

