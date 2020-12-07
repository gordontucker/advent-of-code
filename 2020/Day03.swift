//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day03: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var rows: [[String]]!
    
    public override func linesRead() {
        self.rows = self.reader.readStrings().map({ $0.map({ String($0) }) })
    }
    
    public func part1() -> Int {
        return route(right: 3, down: 1)
    }
    
    public func part2() -> Int {
        return route(right: 1, down: 1) * route(right: 3, down: 1) * route(right: 5, down: 1) * route(right: 7, down: 1) * route(right: 1, down: 2)
    }
    
    public func route(right: Int, down: Int) -> Int {
        var x = 0
        var y = 0
        var treeCount = 0
        
        while y < rows.count {
            let row = rows[y]
            if row[x % row.count] == "#" {
                treeCount += 1
            }
            x += right
            y += down
        }
        
        return treeCount
    }
    
//    public func part2() -> Int? {
//        let ordered = self.numbers.sorted()
//        for a in ordered {
//            for b in ordered.dropFirst() {
//                let c = 2020 - (a + b)
//                if numbers.contains(c) {
//                    return a * b * c
//                }
//            }
//        }
//        return nil
//    }
}
