//
//  Advent_2018_03.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Advent_2018_03 {
    public static func run(_ inputs: [String]) -> (overlapCount: Int, code: String) {
        // Parse inputs into usable structures
        let inputs: [(id: String, x: Int, y: Int, width: Int, height: Int)] = inputs.map({
            let clean = $0.replacingOccurrences(of: " ", with: "")
            let split1 = clean.split(separator: "@")
            let split2 = split1[1].split(separator: ":")
            let position = split2[0].split(separator: ",")
            let size = split2[1].split(separator: "x")
            
            return (id: String(split1[0]), x: Int(position[0])!, y: Int(position[1])!, width: Int(size[0])!, height: Int(size[1])!)
        })
        
        // Build our map of used spaces (determine max x and y from inputs)
        var fabric: [[Int]] = []
        let maxX = inputs.map({ $0.x + $0.width }).max()!
        let maxY = inputs.map({ $0.y + $0.height }).max()!
        for _ in 0 ... maxX {
            fabric.append([Int](repeating: 0, count: maxY))
        }
        
        // Calculate how many overlaps on each x,y
        for input in inputs {
            for x in input.x ..< input.x + input.width {
                for y in input.y ..< input.y + input.height {
                    var row = fabric[x]
                    row[y] += 1
                    fabric[x] = row
                }
            }
        }
        
        // Count the overlaps
        let overlapCount = fabric.map({ row in
            row.map({ $0 >= 2 ? 1 : 0 }).reduce(0, { $0 + $1 })
        }).reduce(0, { $0 + $1 })
        
        // Find the code with no overlaps
        var code: String?
        for input in inputs {
            guard code == nil else { break }
            var overlapped = false
            for x in input.x ..< input.x + input.width {
                guard !overlapped else { break }
                for y in input.y ..< input.y + input.height {
                    guard fabric[x][y] == 1 else {
                        overlapped = true
                        break
                    }
                }
            }
            
            if !overlapped {
                code = input.id
            }
        }
        
        return (overlapCount: overlapCount, code: code ?? "")
    }
}
