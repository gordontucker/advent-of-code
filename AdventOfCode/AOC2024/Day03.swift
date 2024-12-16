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
    
    var rows: [String]!
    
    public override func linesRead() {
        self.rows = self.reader.readStrings()
    }
    
    public func part1() -> Int {
        var value = 0
        for row in rows {
            let groups = row.groups(for: "(mul\\([0-9]{1,3},[0-9]{1,3}\\))")
            for group in groups {
                guard let match = group.first else { continue }
                let clean = match[4 ..< match.length-1]
                let numValues = clean.split(separator: ",")
                let a = Int(numValues[0])!
                let b = Int(numValues[1])!
                
                value += a * b
            }
        }
        return value
    }
    
    public func part2() -> Int {
        var value = 0
        var shouldDo = true
        for row in rows {
            let groups = row.groups(for: "(mul\\([0-9]{1,3},[0-9]{1,3}\\)|do\\(\\)|don't\\(\\))")
            for group in groups {
                guard let match = group.first else { continue }
                if match == "do()" {
                    shouldDo = true
                } else if match == "don't()" {
                    shouldDo = false
                } else if shouldDo {
                    let clean = match[4 ..< match.length-1]
                    let numValues = clean.split(separator: ",")
                    let a = Int(numValues[0])!
                    let b = Int(numValues[1])!
                    
                    value += a * b
                }
            }
        }
        return value
    }
}
