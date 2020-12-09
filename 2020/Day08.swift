//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day08: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var lines: [String] = []
    
    public override func linesRead() {
        self.lines = self.reader.readStrings()
    }
    
    public func part1() -> Int? {
        return nil
    }
    
    public func part2() -> Int? {
        return nil
    }

}
