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
    public enum Instruction {
        case nop(Int)
        case acc(Int)
        case jmp(Int)
        
        init(_ value: String) {
            switch value.prefix(3) {
                case "acc":
                    self = .acc(Int(value.components(separatedBy: " ")[1])!)
                case "jmp":
                    self = .jmp(Int(value.components(separatedBy: " ")[1])!)
                default:
                    self = .nop(Int(value.components(separatedBy: " ")[1])!)
            }
        }
    }
    
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var instructions: [Instruction] = []
    
    public override func linesRead() {
        self.instructions = self.reader.readStrings().map({ Instruction($0) })
    }
    
    public func run(_ instructions: [Instruction]) -> (loop: Bool, total: Int) {
        var rows: Set<Int> = []
        var row = 0
        var total = 0
        while !rows.contains(row) {
            rows.insert(row)
            if row >= instructions.count {
                return (loop: false, total: total)
            }
            switch instructions[row] {
                case .nop:
                    row += 1
                case .acc(let amount):
                    row += 1
                    total += amount
                case .jmp(let lines):
                    row += lines
            }
        }
        return (loop: true, total: total)
    }
    
    public func part1() -> Int? {
        return run(self.instructions).total
    }
    
    public func part2() -> Int? {
        for (index, instruction) in self.instructions.enumerated() {
            var switchedLines = instructions
            if case let .jmp(value) = instruction {
                switchedLines[index] = .nop(value)
            } else if case let .nop(value) = instruction {
                switchedLines[index] = .jmp(value)
            } else {
                continue
            }
            let result = run(switchedLines)
            if !result.loop {
                return result.total
            }
        }
        return nil
    }
}
