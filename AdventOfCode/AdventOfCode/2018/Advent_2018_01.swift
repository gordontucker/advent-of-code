//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Advent_2018_01 {
    
    public static func part1(_ values: [Int]) -> Int {
        return values.reduce(0, { $0 + $1 })
    }
    
    public static func part2(_ values: [Int]) -> Int {
        var value: Int = 0
        var valuesFound: Set<Int> = [0]
        var duplicate: Int?
        while duplicate == nil {
            values.forEach {
                guard duplicate == nil else { return }
                value += $0
                if valuesFound.contains(value) {
                    duplicate = value
                }
                valuesFound.insert(value)
            }
        }
        return duplicate ?? value
    }
}
