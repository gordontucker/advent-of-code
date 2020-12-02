//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
@testable import AOC2020

class aoc_2020Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDay01() {
        self.measure {
            let day1 = Day01()
            XCTAssertEqual(63616, day1.part1())
            XCTAssertEqual(67877784, day1.part2())
        }
    }
    
    func testDay02() {
        let tester = Day02([
            "1-3 a: abcde",
            "1-3 b: cdefg",
            "2-9 c: ccccccccc"])
        
        XCTAssertEqual(2, tester.numberOfValidPasswords())
        XCTAssertEqual(1, tester.numberOfValidPasswords2())
        
        self.measure {
            let day = Day02()
            XCTAssertEqual(640, day.numberOfValidPasswords())
            XCTAssertEqual(472, day.numberOfValidPasswords2())
        }
    }
}
