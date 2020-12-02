//
//  Advent_2018_02.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day02: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    public func checksum() -> Int {
        var twoCount = 0
        var threeCount = 0
        self.reader.readStrings().forEach { (boxId) in
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
    
    public func almostMatchingBoxId() -> String? {
        let boxIds = self.reader.readStrings()
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
