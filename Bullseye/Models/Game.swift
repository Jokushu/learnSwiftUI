//
//  Game.swift
//  Bullseye
//
//  Created by Vincent Gunawan on 25/12/21.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        var point: Int = 0
        if abs(self.target - sliderValue) == 0{
            point = 200
        } else if abs(self.target - sliderValue) < 3 {
            point = 100 - abs(self.target - sliderValue) + 50
        } else {
            point = 100 - abs(self.target - sliderValue)
        }
        return point
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score = points
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

