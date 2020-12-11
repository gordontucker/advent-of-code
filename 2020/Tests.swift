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
    
    func testAllDays() {
        self.measure {
            let day1 = Day01()
            XCTAssertEqual(63616, day1.part1())
            XCTAssertEqual(67877784, day1.part2())
            
            let day2 = Day02()
            XCTAssertEqual(640, day2.numberOfValidPasswords())
            XCTAssertEqual(472, day2.numberOfValidPasswords2())
            
            let day3 = Day03()
            XCTAssertEqual(187, day3.part1())
            XCTAssertEqual(4723283400, day3.part2())
            
            let day4 = Day04()
            XCTAssertEqual(190, day4.part1())
            XCTAssertEqual(121, day4.part2())
            
            let day5 = Day05()
            XCTAssertEqual(996, day5.part1())
            XCTAssertEqual(671, day5.part2())
            
            let day6 = Day06()
            XCTAssertEqual(6457, day6.part1())
            XCTAssertEqual(3260, day6.part2())
            
            let day7 = Day07()
            XCTAssertEqual(172, day7.part1())
            XCTAssertEqual(39645, day7.part2())
            
            let day8 = Day08()
            XCTAssertEqual(1331, day8.part1())
            XCTAssertEqual(1121, day8.part2())
            
            let day9 = Day09()
            XCTAssertEqual(22477624, day9.part1())
            XCTAssertEqual(2980044, day9.part2(find: 22477624))
            
            let day10 = Day10()
            XCTAssertEqual(nil, day10.part1())
            XCTAssertEqual(nil, day10.part2())
        }
    }
    
    func testDay01() {
        let day1 = Day01()
        XCTAssertEqual(63616, day1.part1())
        XCTAssertEqual(67877784, day1.part2())
    }
    
    func testDay02() {
        let tester = Day02([
            "1-3 a: abcde",
            "1-3 b: cdefg",
            "2-9 c: ccccccccc"])
        
        XCTAssertEqual(2, tester.numberOfValidPasswords())
        XCTAssertEqual(1, tester.numberOfValidPasswords2())
    }
    
    func testDay03() {
        let tester = Day03([
            "..##.......",
            "#...#...#..",
            ".#....#..#.",
            "..#.#...#.#",
            ".#...##..#.",
            "..#.##.....",
            ".#.#.#....#",
            ".#........#",
            "#.##...#...",
            "#...##....#",
            ".#..#...#.#"
        ])
        
        XCTAssertEqual(7, tester.part1())
    }
    
    func testDay04() {
        let tester = Day04([
            "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd",
            "byr:1937 iyr:2017 cid:147 hgt:183cm",
            "",
            "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884",
            "hcl:#cfa07d byr:1929",
            "",
            "hcl:#ae17e1 iyr:2013",
            "eyr:2024",
            "ecl:brn pid:760753108 byr:1931",
            "hgt:179cm",
            "",
            "hcl:#cfa07d eyr:2025 pid:166559648",
            "iyr:2011 ecl:brn hgt:59in"
        ])
        
        XCTAssertEqual(2, tester.part1())
        
        let valids = Day04([
            "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980",
            "hcl:#623a2f",
            "",
            "eyr:2029 ecl:blu cid:129 byr:1989",
            "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm",
            "",
            "hcl:#888785",
            "hgt:164cm byr:2001 iyr:2015 cid:88",
            "pid:545766238 ecl:hzl",
            "eyr:2022",
            "",
            "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
        ])
        XCTAssertEqual(4, valids.part2())
    }
    
    func testDay05() {
//        : row 70, column 7, seat ID 567.
//        : row 14, column 7, seat ID 119.
//        : row 102, column 4, seat ID 820.
        XCTAssertEqual(357, Day05.parseBoardingPass("FBFBBFFRLR"))
        XCTAssertEqual(567, Day05.parseBoardingPass("BFFFBBFRRR"))
        XCTAssertEqual(119, Day05.parseBoardingPass("FFFBBBFRRR"))
        XCTAssertEqual(820, Day05.parseBoardingPass("BBFFBBFRLL"))
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
