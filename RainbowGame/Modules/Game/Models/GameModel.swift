//
//  GameModel.swift
//  RainbowGame
//
//  Created by Anton Godunov on 16.11.2023.
//

import Foundation
import UIKit

struct GameModel {
    var timerCounting: Bool
    var backgroundForText: Bool = true
    var timeOfGame: Int = 1
    var time: Int = 0
    var wordNumber: Int = 0
    var timeInterval: Double = 0.3
    
    let colorsOfGame = [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
    
    func getWord(_ index: Int) -> String {
        switch index{
        case 0: return "красный"
        case 1: return "оранжевый"
        case 2: return "желтый"
        case 3: return "зеленый"
        case 4: return "голубой"
        case 5: return "синий"
        case 6: return "фиолетовый"
        default:
            return "серый"
        }
    }
    
        func getColor(_ index: Int) -> UIColor {
            if backgroundForText {
                return .white
            } else {
                switch index{
                case 0: return [UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
                case 1: return [UIColor.red, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
                case 2: return [UIColor.red, UIColor.orange, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
                case 3: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
                case 4: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.blue, UIColor.purple].randomElement()!
                case 5: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.purple].randomElement()!
                case 6: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue].randomElement()!
                default:
                    return .gray
                }
            }
        }
        
    func getBackgroundColor(_ index: Int) -> UIColor {
        if backgroundForText {
            switch index{
            case 0: return [UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
            case 1: return [UIColor.red, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
            case 2: return [UIColor.red, UIColor.orange, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
            case 3: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemBlue, UIColor.blue, UIColor.purple].randomElement()!
            case 4: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.blue, UIColor.purple].randomElement()!
            case 5: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.purple].randomElement()!
            case 6: return [UIColor.red, UIColor.orange, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue, UIColor.blue].randomElement()!
            default:
                return .gray
            }
            
        } else {
            return .clear
        }
    }
    
    
    
}
