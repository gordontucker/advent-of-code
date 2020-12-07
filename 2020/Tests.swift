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
    }
    
}
