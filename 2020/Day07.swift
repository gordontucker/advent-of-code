//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day07: Day {
    class Bag {
        public var attributes: String
        
        public var contains: [(quantity: Int, attributes: String)]
        
        init(_ line: String) {
            let parts = line.components(separatedBy: " bags contain ")
            self.attributes = parts[0]
            
            var contains: [(quantity: Int, attributes: String)] = []
            for contain in parts[1].components(separatedBy: ", ") {
                guard !contain.starts(with: "no ") else { break }
                var attributes = contain.components(separatedBy: " ")
                let count = Int(attributes.removeFirst())!
                attributes.removeLast()
                contains.append((quantity: count, attributes: attributes.joined(separator: " ")))
            }
            self.contains = contains
        }
        
        func canContain(attributes: String, map: [String: Bag]) -> Bool {
            for contain in contains {
                if contain.attributes == attributes {
                    return true
                } else if let bag = map[contain.attributes], bag.canContain(attributes: attributes, map: map) {
                     return true
                }
            }
            return false
        }
        
        func count(quantity: Int, map: [String: Bag]) -> Int {
            let count = self.contains.reduce(0, { $0 + map[$1.attributes]!.count(quantity: $1.quantity, map: map) })
            
            return (count + 1) * quantity
        }
    }
    
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var bags: [String: Bag] = [:]
    
    public override func linesRead() {
        let bags = self.reader.readStrings().map({ Bag($0) })
        var map: [String: Bag] = [:]
        for bag in bags {
            map[bag.attributes] = bag
        }
        self.bags = map
    }
    
    public func part1() -> Int? {
        return bags.values.reduce(0, {
            return $0 + ($1.canContain(attributes: "shiny gold", map: self.bags) ? 1 : 0)
        })
    }
    
    public func part2() -> Int? {
        let bag = self.bags["shiny gold"]!
        return bag.count(quantity: 1, map: self.bags) - 1
    }
}
