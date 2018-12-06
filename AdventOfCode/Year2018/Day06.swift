//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day06: Day {
    public init() { super.init(filename: #file); self.setup() }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)); self.setup() }
    
    struct Point {
        var x: Int
        var y: Int
    }
    var coords: [Point] = []
    func setup() {
        self.coords = self.reader.read({
            let split = $0.components(separatedBy: ", ")

            return Point(x: Int(split[0])!, y: Int(split[1])!)
        })
    }
    
    class Area {
        var point: Point
        var area: Int
        var isEdge: Bool
        
        init(point: Point) {
            self.point = point
            self.area = 0
            self.isEdge = false
        }
        
        func addPoint(_ point: Point, minX: Int, maxX: Int, minY: Int, maxY: Int) {
            if point.x == 0 || point.y == 0 || point.x == maxX || point.y == maxY {
                isEdge = true
            }
            area += 1
        }
    }
    
    public func largestFiniteArea() -> Int {
        let maxX = self.coords.map({ $0.x }).max()! + 30
        let maxY = self.coords.map({ $0.y }).max()! + 30
        let minX = 0
        let minY = 0
        var grid: [[Int]] = []
        
        for x in minX ... maxX {
            var row: [Int] = []
            for y in minY ... maxY {
                var minValue: Int = Int.max
                var minIndex: Int = -1
                var matchCount: Int = 0
                for p in coords.enumerated() {
                    let distance = abs(p.element.x - x) + abs(p.element.y - y)
                    if distance < minValue {
                        matchCount = 1
                        minValue = distance
                        minIndex = p.offset
                    } else if distance == minValue {
                        matchCount += 1
                    }
                }
                
                if matchCount > 1 {
                    row.append(-1)
                } else {
                    row.append(minIndex)
                }
            }
            grid.append(row)
        }
        
        var areas: [Int: Area] = [:]
        for point in coords.enumerated() {
            areas[point.offset] = Area(point: point.element)
        }
        for row in grid.enumerated() {
            for col in row.element.enumerated() {
                guard col.element >= 0 else { continue }
                let area = areas[col.element]!
                area.addPoint(Point(x: row.offset, y: col.offset), minX: minX, maxX: maxX, minY: minY, maxY: maxY)
            }
        }
        
        return areas.filter({ !$0.value.isEdge }).map({ $0.value.area }).max()!
    }
    
    public func regionWithDistance() -> Int {
        let minX = coords.map({ $0.x }).min()!
        let maxX = coords.map({ $0.x }).max()!
        let minY = coords.map({ $0.y }).min()!
        let maxY = coords.map({ $0.y }).max()!
        
        return Array(minX ... maxX).reduce(0, { count, x in
            return Array(minY ... maxY).reduce(count, { count, y in
                let sum: Int = coords.map({ abs($0.x - x) + abs($0.y - y) }).reduce(0,+)
                guard sum < 10000 else { return count }
                return count + 1
            })
        })
    }
}
