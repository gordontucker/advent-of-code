//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day04: Day {
    public enum XDirection: CaseIterable {
        case down
        case same
        case up
    }
    
    public enum YDirection: CaseIterable {
        case left
        case same
        case right
    }
    
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var wordsearch: [[Character]] = []
    var xCount: Int = 0
    var yCount: Int = 0
    
    public override func linesRead() {
        self.wordsearch = self.reader.readStrings().map({ Array($0) })
        self.xCount = self.wordsearch.first!.count
        self.yCount = self.wordsearch.count
    }
    
    public func search(x: Int, y: Int, word: [Character], xDirection: XDirection, yDirection: YDirection) -> Bool {
        guard x >= 0, x < xCount, y >= 0, y < yCount, word.first == wordsearch[x][y] else { return false }
        
        var newX = x
        var newY = y
        switch xDirection {
            case .down: newX -= 1
            case .up: newX += 1
            case .same: break
        }
        switch yDirection {
            case .left: newY -= 1
            case .right: newY += 1
            case .same: break
        }
        
        if word.count == 1 {
            return true
        }
        
        return search(x: newX, y: newY, word: word.suffix(word.count - 1), xDirection: xDirection, yDirection: yDirection)
    }
    
    public func part1() -> Int {
        let word = Array("XMAS")
        
        var count = 0
        for x in 0 ..< xCount {
            for y in 0 ..< yCount {
                for xDirection in XDirection.allCases {
                    for yDirection in YDirection.allCases {
                        if search(x: x, y: y, word: word, xDirection: xDirection, yDirection: yDirection) {
                            count += 1
                        }
                    }
                }
            }
        }
        
        return count
    }
    
    public func part2() -> Int {
        var count = 0
        for x in 1 ..< xCount - 1 {
            for y in 1 ..< yCount - 1 {
                guard wordsearch[x][y] == "A" else { continue }
                
                if (wordsearch[x-1][y-1] == "M" && wordsearch[x+1][y+1] == "S") || (wordsearch[x-1][y-1] == "S" && wordsearch[x+1][y+1] == "M") {
                    if (wordsearch[x-1][y+1] == "M" && wordsearch[x+1][y-1] == "S") || (wordsearch[x-1][y+1] == "S" && wordsearch[x+1][y-1] == "M") {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
}
