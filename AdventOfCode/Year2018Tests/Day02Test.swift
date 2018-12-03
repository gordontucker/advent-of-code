//
//  Advent_2018_02_Test.swift
//  AdventOfCodeTests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day02Test: XCTestCase {
    
    func test02() {
        XCTAssertEqual(12, Day02(["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]).checksum())
        
        let day2 = Day02()
        print("02a: \(day2.checksum())")
        
        XCTAssertEqual("fgij", Day02(["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]).almostMatchingBoxId())
        
        print("02b: \(day2.almostMatchingBoxId() ?? "nil")")
    }
}
