//
//  Advent_2018_02.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Advent_2018_02 {
    public static func part1(_ boxIds: [String]) -> Int {
        var twoCount = 0
        var threeCount = 0
        for boxId in boxIds {
            var counts: [Character: Int] = [:]
            boxId.forEach {
                counts[$0] = (counts[$0] ?? 0) + 1
            }
            
            if counts.values.contains(2) {
                twoCount += 1
            }
            if counts.values.contains(3) {
                threeCount += 1
            }
        }
        return twoCount * threeCount
    }
    
    public static func part2(_ boxIds: [String]) -> String? {
        for boxIdA in boxIds {
            for boxIdB in boxIds {
                let match = zip(boxIdA, boxIdB).compactMap({ $0.0 == $0.1 ? $0.0 : nil })
                if match.count == boxIdA.count - 1 {
                    return String(match)
                }
            }
        }
        
        return nil
    }
}
