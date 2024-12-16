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
    
    var reports: [[Int]]!
    
    public override func linesRead() {
        self.reports = self.reader.readIntRows()
    }
    
    public func isSafe(_ report: [Int]) -> Bool {
        var previousValue: Int?
        var isSafeUp = true
        var isSafeDown = true
        for value in report {
            guard let prev = previousValue else {
                previousValue = value
                continue
            }
            previousValue = value
            if abs(value - prev) > 3 {
                isSafeUp = false
                isSafeDown = false
                break
            }
            if value >= prev {
                isSafeUp = false
            }
            if value <= prev {
                isSafeDown = false
            }
        }
        return isSafeUp || isSafeDown
    }
    
    public func part1() -> Int {
        var safeCount = 0
        for report in reports {
            if isSafe(report) {
                safeCount += 1
            }
        }
        return safeCount
    }
    
    public func part2() -> Int {
        var safeCount = 0
        for report in reports {
            if isSafe(report) {
                safeCount += 1
            } else {
                var isFixedSafe = false
                for i in 0..<report.count {
                    var fixedReport = report
                    fixedReport.remove(at: i)
                    if isSafe(fixedReport) {
                        isFixedSafe = true
                        break
                    }
                }
                if isFixedSafe {
                    safeCount += 1
                }
            }
        }
        return safeCount
    }
}
