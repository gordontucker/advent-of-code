//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day05: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var seatIds: [Int] = []
    
    static func search(_ substring: Substring, left: Substring.Element, lower: Int, upper: Int) -> Int {
        var lower = lower
        var upper = upper
        for char in substring.prefix(7) {
            let half = lower + (upper + 1 - lower) / 2
            if char == left {
                upper = half - 1
            } else {
                lower = half
            }
        }
        return lower
    }
    
    static func parseBoardingPass(_ id: String) -> Int {
        let row = search(id.prefix(7), left: "F", lower: 0, upper: 127)
        let col = search(id.suffix(3), left: "L", lower: 0, upper: 7)
        return row * 8 + col
    }
    
    public override func linesRead() {
        self.seatIds = self.reader.readStrings().map({ Day05.parseBoardingPass($0) }).sorted()
    }
    
    public func part1() -> Int? {
        return self.seatIds.max()
    }
    
    public func part2() -> Int? {
        let seatIds = self.seatIds
        var previousSeat = seatIds.first!
        for seat in self.seatIds {
            if seat - previousSeat == 2 {
                return previousSeat + 1
            }
            previousSeat = seat
        }
        return nil
    }
}
