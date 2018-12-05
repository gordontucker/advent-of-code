//
//  Day05Test.swift
//  Year2018Tests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day05Test: XCTestCase {

    func testDay05() {
        let sampleDay = Day05(["dabAcCaCBAcCcaDA"])
        XCTAssertEqual(10, sampleDay.reactPolymers().count)
        XCTAssertEqual(4, sampleDay.removeAndReactPolymer().count)
        
        let day = Day05()
        print("05a: \(day.reactPolymers().count)")
        print("05b: \(day.removeAndReactPolymer().count)")
    }

}
