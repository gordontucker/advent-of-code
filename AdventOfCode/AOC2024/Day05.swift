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
    
    var orders: [Int:[Int]] = [:]
    var invertedOrders: [Int:[Int]] = [:]
    var codePositions: [[Int: Int]] = []
    var codes: [[Int]] = []
    
    public override func linesRead() {
        var orders: [Int:[Int]] = [:]
        var invertedOrders: [Int:[Int]] = [:]
        var hasReachedCodes = false
        self.reader.readStrings().forEach({
            if hasReachedCodes {
                var codePositions: [Int: Int] = [:]
                let codes = $0.components(separatedBy: ",").map({Int($0)!})
                codes.enumerated().forEach({
                    codePositions[$0.element] = $0.offset
                })
                self.codes.append(codes)
                self.codePositions.append(codePositions)
            } else if $0 == "" {
                hasReachedCodes = true
            } else {
                let parts = $0.components(separatedBy: "|")
                let left = Int(parts[0])!
                let right = Int(parts[1])!
                var entry = orders[left] ?? []
                entry.append(right)
                orders[left] = entry
                
                var inverted = invertedOrders[right] ?? []
                inverted.append(left)
                invertedOrders[right] = inverted
                
//                print("\(right) must be after \(entry.map({"\($0)"}).joined(separator: ","))")
            }
        })
        self.orders = orders
        self.invertedOrders = invertedOrders
    }
    
    public func part1() -> Int {
        var middleValues: [Int] = []
        for index in 0 ..< (self.codes.count) {
            var isValid = true
            
            let codes = self.codes[index]
            let codePositions = self.codePositions[index]
            
            for code in codes {
                guard let afterPages = self.orders[code] else {
                    // No rule for this number
                    continue
                }
                
                let beforePosition = codePositions[code]!
                
                for afterPage in afterPages {
                    guard let afterPosition = codePositions[afterPage] else {
                        // No after page
                        continue
                    }
                    
                    if afterPosition < beforePosition {
                        isValid = false
                        // Invalid position, move
                        break
                    }
                }
            }
            
            if isValid {
                let allCodes = self.codes[index]
                middleValues.append(allCodes[allCodes.count / 2])
            }
        }
        
//        print("Middle values: \(middleValues.map({ "\($0)" }).joined(separator: ","))")
        return middleValues.reduce(0, { $0 + $1 })
    }
    
    public func part2() -> Int? {
        var middleValues: [Int] = []
        for codesIndex in 0 ..< (self.codes.count) {
            var isValid = true
            
            var codes = self.codes[codesIndex]
            var codePositions = self.codePositions[codesIndex]
            
            var index = 0
//            print("Codes: \(codes.map({ "\($0)" }).joined(separator: ","))")
            while index < codes.count {
                let code = codes[index]
//                print("Checking \(index) (\(code))")
                guard let beforeCodes = self.invertedOrders[code] else {
                    // No rule for this number
//                    print("Found no after codes for \(code)")
                    index += 1
                    continue
                }
                
                let afterPosition = codePositions[code]!
                
                for beforeCode in beforeCodes {
                    guard let beforePosition = codePositions[beforeCode] else {
                        // No after page
                        continue
                    }
                    
                    if afterPosition < beforePosition {
                        isValid = false
//                        print("Found invalid \(beforeCode) after \(code)")
                        codes.remove(at: beforePosition)
                        codes.insert(beforeCode, at: afterPosition)
                        for (index,code) in codes.enumerated().filter({ $0.offset >= index }) {
                            codePositions[code] = index
                        }
                        
//                        print("Adjusted: \(codes.map({ "\($0)" }).joined(separator: ","))")
                        // Invalid position, rerun this step
                        index -= 1
                        break
                    }
                }
                index += 1
            }
            
            if !isValid {
//                print("Sorted: \(codes.map({ "\($0)" }).joined(separator: ","))")
                middleValues.append(codes[codes.count / 2])
            }
        }
        
//        print("Middle values: \(middleValues.map({ "\($0)" }).joined(separator: ","))")
        return middleValues.reduce(0, { $0 + $1 })
    }
}
