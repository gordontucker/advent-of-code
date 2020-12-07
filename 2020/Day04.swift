//
//  Advent_2018_01.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit
import AOCshared

public class Passport {
    enum Height: Equatable {
        case inch(Int)
        case cm(Int)
        case unknown
        
        init?(_ value: String) {
            switch value.suffix(2) {
                case "in":
                    self = .inch(Int(value.prefix(value.count - 2)) ?? 0)
                case "cm":
                    self = .cm(Int(value.prefix(value.count - 2)) ?? 0)
                default:
                    self = .unknown
            }
        }
    }
    
    enum EyeColor: String {
        case amb
        case blu
        case brn
        case gry
        case grn
        case hzl
        case oth
        case other
        
        init(_ value: String) {
            self = EyeColor(rawValue: value) ?? .other
        }
    }
    
    
    
    var birthYear: Int
    var issueYear: Int
    var expYear: Int
    var height: Height
    var hairColor: String
    var eyeColor: EyeColor
    var passportId: String
    var countryId: String?
    
    var isValid: Bool {
        guard birthYear >= 1920 && birthYear <= 2002,
            issueYear >= 2010 && issueYear <= 2020,
            expYear >= 2020 && expYear <= 2030,
            hairColor.range(of: #"^#[0-9a-f]{6}$"#, options: .regularExpression) != nil,
            passportId.count == 9,
            height != .unknown,
            eyeColor != .other
        else {
            return false
        }
        
        switch self.height {
            case .cm(let h):
                return h >= 150 && h <= 193
            case .inch(let h):
                return h >= 59 && h <= 76
            case .unknown:
                return false
        }
    }
    
    public init?(_ fields: String) {
        let splitFields = fields.components(separatedBy: " ").filter({ !$0.isEmpty })
        
        var birthYear: Int?
        var issueYear: Int?
        var expYear: Int?
        var height: Height?
        var hairColor: String?
        var eyeColor: EyeColor?
        var passportId: String?
        var countryId: String?
        
        for field in splitFields {
            switch field.prefix(3) {
                case "byr": birthYear = Int(field.suffix(field.count - 4))
                case "iyr": issueYear = Int(field.suffix(field.count - 4))
                case "eyr": expYear = Int(field.suffix(field.count - 4))
                case "hgt": height = Height(String(field.suffix(field.count - 4)))
                case "hcl": hairColor = String(field.suffix(field.count - 4))
                case "ecl": eyeColor = EyeColor(String(field.suffix(field.count - 4)))
                case "pid": passportId = String(field.suffix(field.count - 4))
                case "cid": countryId = String(field.suffix(field.count - 4))
                default: break
            }
        }
        
        guard
            let birthYearNonNil = birthYear,
            let issueYearNonNil = issueYear,
            let expYearNonNil = expYear,
            let heightNonNil = height,
            let hairColorNonNil = hairColor,
            let eyeColorNonNil = eyeColor,
            let passportIdNonNil = passportId
        else {
            return nil
        }
                
        self.birthYear = birthYearNonNil
        self.issueYear = issueYearNonNil
        self.expYear = expYearNonNil
        self.height = heightNonNil
        self.hairColor = hairColorNonNil
        self.eyeColor = eyeColorNonNil
        self.passportId = passportIdNonNil
        self.countryId = countryId
    }
    
    public static func parseNext(lines: inout [String]) -> Passport? {
        if let newLine = lines.firstIndex(of: "") {
            let fields = Array(lines[...newLine]).joined(separator: " ")
            lines.removeSubrange(...newLine)
            return Passport(fields)
        } else {
            let fields = lines.joined(separator: " ")
            lines.removeAll()
            return Passport(fields)
        }
    }
}

public class Day04: Day {
    
    
    public init() { super.init(filename: #file) }
    public init(_ lines: [String]) { super.init(reader: ArrayReader(lines)) }
    
    var passports: [Passport] = []
    
    public override func linesRead() {
        var lines = self.reader.readStrings()
        var passports: [Passport] = []
        while lines.count > 0 {
            if let passport = Passport.parseNext(lines: &lines) {
                passports.append(passport)
            }
        }
        self.passports = passports
    }
    
    public func part1() -> Int {
        return passports.count
    }
    
    public func part2() -> Int? {
        return passports.filter({ $0.isValid }).count
    }
}
