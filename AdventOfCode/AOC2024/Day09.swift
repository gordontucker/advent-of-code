//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day09: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var numbers: [Int] = []
    
    public override func linesRead() {
        self.numbers = self.reader.readInts()
    }
    
    public func part1(preamble: Int = 25) -> Int? {
        var lastNumberIndex: Int = 0
        var index = preamble + 1
        while index < self.numbers.count {
            let number = self.numbers[index]
            
            var isValid = false
            for number1 in self.numbers[lastNumberIndex...(index-1)].filter({ $0 < number }) {
                for number2 in self.numbers[lastNumberIndex...(index-1)].filter({ $0 < number }) {
                    if number1 + number2 == number {
                        isValid = true
                        break
                    }
                }
                if isValid {
                    break
                }
            }
            
            if !isValid {
                return number
            }
            
            lastNumberIndex += 1
            index += 1
        }
        return nil
    }
    
    public func part2(find number: Int) -> Int? {
        var index = 0
        while index < self.numbers.count {
            var count = self.numbers[index]
            var tmpIndex = index + 1
            var numbers: Set<Int> = [self.numbers[index]]
            while count < number {
                count += self.numbers[tmpIndex]
                numbers.insert(self.numbers[tmpIndex])
                tmpIndex += 1
            }
            if count == number {
                return numbers.min()! + numbers.max()!
            }
            
            index += 1
        }
        return nil
    }

}
