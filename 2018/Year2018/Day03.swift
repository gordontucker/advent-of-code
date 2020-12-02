//
//  Advent_2018_03.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day03: Day {
    public init() {
        super.init(filename: #file)
        self.run()
    }
    public init(_ lines: [String]) {
        super.init(reader: ArrayReader(lines))
        self.run()
    }
    
    public var overlapCount: Int = 0
    public var code: String = ""
    
    public func run() {
        // Parse inputs into usable structures
        let inputs: [(id: String, x: Int, y: Int, width: Int, height: Int)] = self.reader.read({
            let clean = $0.replacingOccurrences(of: " ", with: "")
            let split1 = clean.split(separator: "@")
            let split2 = split1[1].split(separator: ":")
            let position = split2[0].split(separator: ",")
            let size = split2[1].split(separator: "x")
            
            return (id: String(split1[0]), x: Int(position[0])!, y: Int(position[1])!, width: Int(size[0])!, height: Int(size[1])!)
        })
        
        // Build our map of used spaces (determine max x and y from inputs)
        let maxX = inputs.map({ $0.x + $0.width }).max()!
        let maxY = inputs.map({ $0.y + $0.height }).max()!
        var fabric = [Int](repeating: 0, count: maxX * maxY)
        
        // Calculate how many overlaps on each x,y
        for input in inputs {
            for x in input.x ..< input.x + input.width {
                for y in input.y ..< input.y + input.height {
                    fabric[x + (y * maxX)] += 1
                }
            }
        }
        
        // Count the overlaps
        self.overlapCount = fabric.reduce(0, { $0 + ($1 >= 2 ? 1 : 0) })
        
        // Find the code with no overlaps
        for input in inputs {
            var overlapped = false
            for x in input.x ..< input.x + input.width {
                guard !overlapped else { break }
                for y in input.y ..< input.y + input.height {
                    guard fabric[x + (y * maxX)] == 1 else {
                        overlapped = true
                        break
                    }
                }
            }
            
            if !overlapped {
                self.code = input.id
                break
            }
        }
    }
}
