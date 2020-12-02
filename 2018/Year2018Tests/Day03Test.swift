//
//  Advent_2018_03_Test.swift
//  AdventOfCodeTests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day03Test: XCTestCase {
    
    func test03() {
        XCTAssertEqual(4, Day03([
                "#1 @ 1,3: 4x4",
                "#2 @ 3,1: 4x4",
                "#3 @ 5,5: 2x2"]).overlapCount)
        
        let day3 = Day03()
        print("03a: \(day3.overlapCount)")
        print("03b: \(day3.code)")
    }
}
