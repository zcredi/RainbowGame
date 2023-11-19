//
//  Source.swift
//  RainbowGame
//
//  Created by Admin on 13.11.2023.
//

import UIKit

struct Statistick: Codable{
    let gameNomer: String
    let time:String
}

struct Source{
   static func uploadArrayToUserDefaults(startTimeTimer:Double){
        let defaults = UserDefaults.standard
        do {
            if var statistickArray = defaults.object(forKey: "StatistickArray") as? [Data] {
                let newStatistick = Statistick(gameNomer: "\(statistickArray.count + 1)", time: "\(startTimeTimer)")
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(newStatistick) {
                    statistickArray.append(encoded)
                    print(statistickArray)
                    defaults.set(statistickArray, forKey: "StatistickArray")
                }
            } else {
                var statistickArray: [Data] = []
                let newStatistick = Statistick(gameNomer: "1", time: "\(startTimeTimer)")
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(newStatistick) {
                    statistickArray.append(encoded)
                    print(statistickArray)
                    defaults.set(statistickArray, forKey: "StatistickArray")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
   static func getArrayToUserDefaults()->[Statistick]{
        let defaults = UserDefaults.standard
        do {
            if let savedData = defaults.object(forKey: "StatistickArray") as? [Data] {
                let decoder = JSONDecoder()
                let statistickArray = try savedData.map { try decoder.decode(Statistick.self, from: $0) }
                return statistickArray
            }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
