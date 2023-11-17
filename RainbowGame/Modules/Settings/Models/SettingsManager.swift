//
//  Settings.swift
//  RainbowGame
//
//  Created by Andrei Shpartou on 15/11/2023.
//

import Foundation

class SettingsManager {
    
    public enum Keys: String {
        case playTime = "playTime"
        case taskSpeed = "taskSpeed"
        case backBoardShowing = "backBoardShowing"
    }
    
    private let defaultSettings: [Keys: Any] = [.playTime: Float(5), .taskSpeed: Float(3), .backBoardShowing: true]
    
    private let userDefaults = UserDefaults.standard
    
    func set(_ object: Any?, forKey key: Keys) {
        userDefaults.set(object, forKey: key.rawValue)
    }
    
    func get(forKey key: Keys) -> Any? {
        userDefaults.object(forKey: key.rawValue) ?? defaultSettings[key]
    }
    
}

