//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day01: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    public func finalFrequency() -> Int {
        return self.reader.readInts().reduce(0, { $0 + $1 })
    }
    
    public func duplicateFrequency() -> Int {
        let values = self.reader.readInts()
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
        return duplicate!
    }
}
