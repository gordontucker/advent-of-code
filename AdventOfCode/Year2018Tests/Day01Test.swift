//
//  Advent_2018_01_Test.swift
//  AdventOfCodeTests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day01Test: XCTestCase {
    func testPart1() {
        XCTAssertEqual(3, Day01(["1","-2", "4"]).finalFrequency())
        
        print("01a: \(Day01().finalFrequency())")
    }
    
    func testPart2() {
        XCTAssertEqual(0, Day01(["1", "-1"]).duplicateFrequency())
        XCTAssertEqual(10, Day01(["+3", "+3", "+4", "-2", "-4"]).duplicateFrequency())
        XCTAssertEqual(5, Day01(["-6", "+3", "+8", "+5", "-6"]).duplicateFrequency())
        XCTAssertEqual(14, Day01(["+7", "+7", "-2", "-7", "-4"]).duplicateFrequency())
        
        print("01b: \(Day01().duplicateFrequency())")
    }
}
