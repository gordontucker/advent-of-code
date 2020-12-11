//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day06: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var groups: [[String]] = []
    
    public override func linesRead() {
        self.groups = self.reader.readStringGroups()
    }
    
    public func part1() -> Int? {
        var groupAnswers: [Set<Character>] = []
        for group in groups {
            groupAnswers.append(Set(group.joined().filter({ $0.isLetter })))
        }
        return groupAnswers.reduce(0, { $0 + $1.count })
    }
    
    public func part2() -> Int? {
        var groupAnswers: [Set<Character>] = []
        for group in groups {
            var answers: [Set<Character>] = group.map({
                Set($0.filter({ $0.isLetter }))
            })
            
            var intersectedAnswers = answers.removeFirst()
            for answer in answers {
                intersectedAnswers.formIntersection(answer)
            }
            
            groupAnswers.append(intersectedAnswers)
        }
        return groupAnswers.reduce(0, { $0 + $1.count })
    }
}
