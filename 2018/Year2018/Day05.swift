//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day05: Day {
    public init() { super.init(filename: #file); polymer = reader.readString()! }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)); polymer = reader.readString()! }
    
    var polymer: String = ""
    
    public func reactPolymers() -> String {
        return reactPolymer(polymer)
    }
    
    private func reactPolymer(_ polymer: String, skip: String? = nil) -> String {
        func areChemicalsReactive(_ a: Character, b: Character) -> Bool {
            guard a != b else { return false }
            // Check if upper and lower match
            return (a.unicodeScalars.first!.value - 65) % 32 == (b.unicodeScalars.first!.value - 65) % 32
        }
        
        var newPolymer: [Character] = []
        for character in polymer {
            guard skip?.contains(character) != true else { continue }
            guard newPolymer.count > 0 else {
                newPolymer.append(character)
                continue
            }
            if areChemicalsReactive(character, b: newPolymer.last!) {
                newPolymer.removeLast()
            } else {
                newPolymer.append(character)
            }
        }
        return String(newPolymer)
    }
    
    public func removeAndReactPolymer() -> String {
        let polymerVariants: [String] = "abcdefghijklmnopqurstuvwxyz".map {
            return self.reactPolymer(polymer, skip: "\($0)\(String($0).uppercased())")
        }
        return polymerVariants.min(by: { $0.count < $1.count })!
    }
}
