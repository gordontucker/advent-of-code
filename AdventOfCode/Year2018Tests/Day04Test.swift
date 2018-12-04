//
//  Day04Test.swift
//  Year2018Tests
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import Year2018

class Day04Test: XCTestCase {

    func testDay04() {
        let sampleDay = Day04(["[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-01 23:58] Guard #99 begins shift",
            "[1518-11-02 00:40] falls asleep",
            "[1518-11-02 00:50] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            "[1518-11-04 00:02] Guard #99 begins shift",
            "[1518-11-04 00:36] falls asleep",
            "[1518-11-04 00:46] wakes up",
            "[1518-11-05 00:03] Guard #99 begins shift",
            "[1518-11-05 00:45] falls asleep",
            "[1518-11-05 00:55] wakes up"])
//
//        sampleDay.entries.forEach({ print("entry: \($0.id) - \($0.date) - \($0.action.rawValue)") })
//        sampleDay.shifts.forEach({ print("shift: \($0.guardId) - \($0.sleepTime)") })
//
        let sampleSleepingGuard = sampleDay.sleepingMostGuard()
        XCTAssertEqual("#10", sampleSleepingGuard.id)
        XCTAssertEqual(24, sampleSleepingGuard.minute)
        
        let sampleMinuteGuard = sampleDay.sleepingOnMinuteMost()
        XCTAssertEqual("#99", sampleMinuteGuard.id)
        XCTAssertEqual(45, sampleMinuteGuard.minute)
        
        let day = Day04()
        let sleepingGuard = day.sleepingMostGuard()
        let minuteGuard = day.sleepingOnMinuteMost()
        
        print("04a: \(sleepingGuard.id) - \(sleepingGuard.minute)")
        print("04b: \(minuteGuard.id) - \(minuteGuard.minute)")
    }

}
