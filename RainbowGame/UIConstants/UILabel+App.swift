//
//  UILabel+App.swift
//  RainbowGame
//
//  Created by Владислав on 13.11.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
