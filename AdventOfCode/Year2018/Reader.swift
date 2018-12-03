//
//  Reader.swift
//  Year2018
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public protocol Reader {
    func readString() -> String?
    func readStrings() -> [String]
    func readInts() -> [Int]
    func read<T>(_ map: (String) -> T?) -> [T]
}

extension Reader {
    public func readStrings() -> [String] {
        var strings: [String] = []
        while let nextLine = readString() {
            strings.append(nextLine)
        }
        return strings
    }
    
    public func readInts() -> [Int] {
        return self.read({ Int($0) })
    }
    
    public func read<T>(_ map: (String) -> T?) -> [T] {
        return self.readStrings().compactMap(map)
    }
}

class FileReader: Reader {
    let encoding: String.Encoding
    let chunkSize: Int
    let fileHandle: FileHandle
    var buffer: Data
    let delimPattern : Data
    var isAtEOF: Bool = false
    
    init?(url: URL, delimeter: String = "\n", encoding: String.Encoding = .utf8, chunkSize: Int = 4096)
    {
        guard let fileHandle = try? FileHandle(forReadingFrom: url) else { return nil }
        self.fileHandle = fileHandle
        self.chunkSize = chunkSize
        self.encoding = encoding
        buffer = Data(capacity: chunkSize)
        delimPattern = delimeter.data(using: .utf8)!
    }
    
    deinit {
        fileHandle.closeFile()
    }
    
    func rewind() {
        fileHandle.seek(toFileOffset: 0)
        buffer.removeAll(keepingCapacity: true)
        isAtEOF = false
    }
    
    func nextLine() -> String? {
        if isAtEOF { return nil }
        
        repeat {
            if let range = buffer.range(of: delimPattern, options: [], in: buffer.startIndex..<buffer.endIndex) {
                let subData = buffer.subdata(in: buffer.startIndex..<range.lowerBound)
                let line = String(data: subData, encoding: encoding)
                buffer.replaceSubrange(buffer.startIndex..<range.upperBound, with: [])
                return line
            } else {
                let tempData = fileHandle.readData(ofLength: chunkSize)
                if tempData.count == 0 {
                    isAtEOF = true
                    return (buffer.count > 0) ? String(data: buffer, encoding: encoding) : nil
                }
                buffer.append(tempData)
            }
        } while true
    }
    
    func readString() -> String? {
        return self.nextLine()
    }
}

public class ArrayReader: Reader {
    public var lines: [String]
    
    public init(_ allLines: String) {
        self.lines = allLines.components(separatedBy: CharacterSet.newlines)
    }
    
    public init(_ lines: [String]) {
        self.lines = lines
    }
    
    public func readString() -> String? {
        guard lines.count > 0 else { return nil }
        return lines.removeFirst()
    }
    
    public func readStrings() -> [String] {
        return lines
    }
}
