//
//  Source.swift
//  RainbowGame
//
//  Created by Admin on 13.11.2023.
//

import UIKit

struct Statistick{
    let gameNomer: String
    let time:String
}

struct Source{
    static func makeStatistick() -> [Statistick]{
        [
            .init(gameNomer: "1", time: "21.0"),
            .init(gameNomer: "2", time: "5.0"),
            .init(gameNomer: "3", time: "13.0"),
            .init(gameNomer: "4", time: "11.0"),
        ]
    }
}
