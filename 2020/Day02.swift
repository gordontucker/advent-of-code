//
//  Advent_2018_02.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Day02: Day {
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var lines: [(lower: Int, upper: Int, letter: String, password: [String])]!
    
    public override func linesRead() {
        self.lines = self.reader.readStrings().map({ line in
            let parts = line.components(separatedBy: CharacterSet(charactersIn: " :-"))
            return (
                lower: Int(parts[0])!,
                upper: Int(parts[1])!,
                letter: parts[2],
                password: parts[4].map({ String($0) }))
        })
    }
    
    public func numberOfValidPasswords() -> Int {
        var numberOfValidPasswords = 0
        for line in lines {
            let count = line.password.filter({ $0 == line.letter }).count
            if count >= line.lower && count <= line.upper {
                numberOfValidPasswords += 1
            }
        }
        
        return numberOfValidPasswords
    }
    
    public func numberOfValidPasswords2() -> Int {
        var numberOfValidPasswords = 0
        for line in lines {
            
            let char1 = line.password[line.lower - 1]
            let char2 = line.password[line.upper - 1]
            if char1 == line.letter || char2 == line.letter, char1 != char2 {
                numberOfValidPasswords += 1
            }
        }
        
        return numberOfValidPasswords
    }
}
