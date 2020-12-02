//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day01: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var numbers: Set<Int>!
    
    public override func linesRead() {
        self.numbers = Set(self.reader.readInts())
    }
    
    public func part1() -> Int? {
        let numbers = Set(self.numbers)
        for a in numbers {
            let b = 2020 - a
            if numbers.contains(b) {
                return a * b
            }
        }
        return nil
    }
    
    public func part2() -> Int? {
        let ordered = self.numbers.sorted()
        for a in ordered {
            for b in ordered.dropFirst() {
                let c = 2020 - (a + b)
                if numbers.contains(c) {
                    return a * b * c
                }
            }
        }
        return nil
    }
}
