//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day04: Day {
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "[yyyy-MM-dd HH:mm]"
        return formatter
    }()
    
    public enum Action: String {
        case fallAsleep = "falls"
        case wakesUp = "wakes"
        case startsShift = "Guard"
    }
    
    public struct Entry {
        
        public var id: String
        public var date: Date
        public var action: Action
        public var minute: Int
        
        init (_ line: String, previousGuardId: String = "") {
            let parts = line.split(separator: " ")
            let action = Action(rawValue: String(parts[2]))!
            self.action = action
            self.id = action == .startsShift ? String(parts[3]) : previousGuardId
            
            self.date = Day04.formatter.date(from: "\(parts[0]) \(parts[1])") ?? Date()
            
            self.minute = Int(parts[1].replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "]", with: ""))!
        }
    }
    
    public struct Shift {
        public var guardId: String
        public var entries: [Entry] = []
        public var endDate: Date
        public var sleepMinutes: Set<Int> = []
        public var sleepTime: Int {
            return sleepMinutes.count
        }
        
        init(_ entries: [Entry]) {
            self.entries = entries
            endDate = entries.last!.date
            self.guardId = entries[0].id
            var previousTime = 0
            var sleepMinutes: Set<Int> = []
            for entry in entries.suffix(entries.count - 1) {
                if entry.action == .wakesUp {
                    for i in previousTime ..< entry.minute {
                        sleepMinutes.insert(i)
                    }
                }
                previousTime = entry.minute
            }
            self.sleepMinutes = sleepMinutes
        }
    }
    
    public init() { super.init(filename: #file); setup() }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)); setup() }
    
    public var entries: [Entry] = []
    public var shifts: [Shift] = []
    
    private func setup() {
        // Parse entries
        var previousGuardId: String = ""
        var entries: [Entry] = self.reader.read({
            let entry = Entry($0, previousGuardId: previousGuardId)
            previousGuardId = entry.id
            return entry
        })
        entries.sort(by: { $0.date < $1.date })
        self.entries = entries
        
        // Enter sorted entries into shifts
        var shifts: [Shift] = []
        var shiftEntries: [Entry] = []
        for entry in entries {
            if shiftEntries.count != 0 && entry.action == .startsShift {
                // Finished shift
                shifts.append(Shift(shiftEntries))
                shiftEntries = []
            }
            shiftEntries.append(entry)
        }
        shifts.append(Shift(shiftEntries))
        
        self.shifts = shifts
    }
    
    public func sleepingMostGuard() -> (id: String, minute: Int) {
        var sleepTime: [String: Int] = [:]
        for shift in shifts {
            let time = sleepTime[shift.guardId] ?? 0
            sleepTime[shift.guardId] = time + shift.sleepTime
        }
        
        let sleepingGuard = sleepTime.max(by: { $0.value < $1.value })!
        
        var minuteCount: [Int: Int] = [:]
        for shift in shifts.filter({ $0.guardId == sleepingGuard.key }) {
            for minute in shift.sleepMinutes {
                minuteCount[minute] = (minuteCount[minute] ?? 0) + 1
            }
        }
        
        let maxMinute = minuteCount.max(by: { $0.value < $1.value })!.key
        
        return (id: sleepingGuard.key, minute: maxMinute)
    }
    
    public func sleepingOnMinuteMost() -> (id: String, minute: Int) {
        var counts: [String: [Int: Int]] = [:]
        for shift in shifts {
            var minuteCount = counts[shift.guardId] ?? [:]
            for minute in shift.sleepMinutes {
                minuteCount[minute] = (minuteCount[minute] ?? 0) + 1
            }
            counts[shift.guardId] = minuteCount
        }
        
        let maxGuard = counts.max(by: { ($0.value.values.max() ?? 0) < ($1.value.values.max() ?? 0) })!
        let maxMinute = maxGuard.value.max(by: { $0.value < $1.value })!
        
        return (id: maxGuard.key, minute: maxMinute.key)
    }
}
