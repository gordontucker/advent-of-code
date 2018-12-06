//
//  Day06Test.swift
//  Year2018Tests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day06Test: XCTestCase {

    func testDay06Sample() {
        let day = Day06([
            "1, 1",
            "1, 6",
            "8, 3",
            "3, 4",
            "5, 5",
            "8, 9"
        ])
        XCTAssertEqual(17, day.largestFiniteArea())
    }
    
    func testDay06() {
        let day = Day06()
        
        print("06a: \(day.largestFiniteArea())")
        print("06b: \(day.regionWithDistance())")
    }

}
