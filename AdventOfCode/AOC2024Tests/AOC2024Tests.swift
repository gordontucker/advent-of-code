//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
@testable import AOC2024

class AOC2024Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllDays() {
        self.measure {
            let day1 = Day01()
            XCTAssertEqual(2430334, day1.part1())
            XCTAssertEqual(28786472, day1.part2())
            
            let day2 = Day02()
            XCTAssertEqual(483, day2.part1())
            XCTAssertEqual(528, day2.part2())
            
            let day3 = Day03()
            XCTAssertEqual(168539636, day3.part1())
            XCTAssertEqual(97529391, day3.part2())
            
            let day4 = Day04()
            XCTAssertEqual(2297, day4.part1())
            XCTAssertEqual(1745, day4.part2())
            
            let day5 = Day05()
            XCTAssertEqual(4462, day5.part1())
//            XCTAssertEqual(671, day5.part2())
            
//            let day6 = Day06()
//            XCTAssertEqual(6457, day6.part1())
//            XCTAssertEqual(3260, day6.part2())
//            
//            let day7 = Day07()
//            XCTAssertEqual(172, day7.part1())
//            XCTAssertEqual(39645, day7.part2())
//            
//            let day8 = Day08()
//            XCTAssertEqual(1331, day8.part1())
//            XCTAssertEqual(1121, day8.part2())
//            
//            let day9 = Day09()
//            XCTAssertEqual(22477624, day9.part1())
//            XCTAssertEqual(2980044, day9.part2(find: 22477624))
//            
//            let day10 = Day10()
//            XCTAssertEqual(nil, day10.part1())
//            XCTAssertEqual(nil, day10.part2())
        }
    }
    
    func testDay01() {
        let day1 = Day01([
            "3   4",
            "4   3",
            "2   5",
            "1   3",
            "3   9",
            "3   3",
        ])
        XCTAssertEqual(11, day1.part1())
        XCTAssertEqual(31, day1.part2())
    }
    
    func testDay02() {
        let tester = Day02([
            "7 6 4 2 1",
            "1 2 7 8 9",
            "9 7 6 2 1",
            "1 3 2 4 5",
            "8 6 4 4 1",
            "1 3 6 7 9",
        ])
        
        XCTAssertEqual(2, tester.part1())
        XCTAssertEqual(4, tester.part2())
    }
    
    func testDay03() {
        let tester = Day03([
            "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
        ])
        
        XCTAssertEqual(161, tester.part1())
        
        let tester2 = Day03(["xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"])
        XCTAssertEqual(48, tester2.part2())
    }
    
    func testDay04() {
        let tester = Day04([
            "MMMSXXMASM",
            "MSAMXMSMSA",
            "AMXSXMAAMM",
            "MSAMASMSMX",
            "XMASAMXAMM",
            "XXAMMXXAMA",
            "SMSMSASXSS",
            "SAXAMASAAA",
            "MAMMMXMMMM",
            "MXMXAXMASX",
        ])
        
        XCTAssertEqual(18, tester.part1())
        XCTAssertEqual(9, tester.part2())
    }
    
    func testDay05() {
//        : row 70, column 7, seat ID 567.
//        : row 14, column 7, seat ID 119.
//        : row 102, column 4, seat ID 820.
        let day = Day05([
            "47|53",
            "97|13",
            "97|61",
            "97|47",
            "75|29",
            "61|13",
            "75|53",
            "29|13",
            "97|29",
            "53|29",
            "61|53",
            "97|53",
            "61|29",
            "47|13",
            "75|47",
            "97|75",
            "47|61",
            "75|61",
            "47|29",
            "75|13",
            "53|13",
            "",
            "75,47,61,53,29",
            "97,61,53,29,13",
            "75,29,13",
            "75,97,47,61,53",
            "61,13,29",
            "97,13,75,29,47",
        ])
        XCTAssertEqual(143, day.part1())
        XCTAssertEqual(123, day.part2())
    }
    
    func testDay05Part1() {
        let day5 = Day05()
        XCTAssertEqual(4462, day5.part1())
    }
    
    func testDay05Part2() {
        let day5 = Day05()
        XCTAssertEqual(6767, day5.part2())
    }
    
    func testDay06() {
        let tester = Day06([
            "abc",
            "",
            "a",
            "b",
            "c",
            "",
            "ab",
            "ac",
            "",
            "a",
            "a",
            "a",
            "a",
            "",
            "b"
        ])
        XCTAssertEqual(11, tester.part1())
        XCTAssertEqual(6, tester.part2())
    }
    
    func testDay07() {
        let tester = Day07([
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "bright white bags contain 1 shiny gold bag.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
            "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
            "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
            "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
            "faded blue bags contain no other bags.",
            "dotted black bags contain no other bags."
        ])
        
        XCTAssertEqual(4, tester.part1())
        XCTAssertEqual(32, tester.part2())
    }
    
    func testDay08() {
        let tester = Day08([
            "nop +0",
            "acc +1",
            "jmp +4",
            "acc +3",
            "jmp -3",
            "acc -99",
            "acc +1",
            "jmp -4",
            "acc +6"
        ])
        
        XCTAssertEqual(5, tester.part1())
        XCTAssertEqual(8, tester.part2())
    }
    
    func testDay09() {
        let tester = Day09([
            "35",
            "20",
            "15",
            "25",
            "47",
            "40",
            "62",
            "55",
            "65",
            "95",
            "102",
            "117",
            "150",
            "182",
            "127",
            "219",
            "299",
            "277",
            "309",
            "576"
        ])
        
        XCTAssertEqual(127, tester.part1(preamble: 5))
        XCTAssertEqual(62, tester.part2(find: 127))
    }
}

