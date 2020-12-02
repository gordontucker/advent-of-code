//
//  Day.swift
//  Year2018
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

open class Day {
    public let reader: Reader
    
    public init(reader: Reader) {
        self.reader = reader
        self.linesRead()
    }
    
    public init(filename: String) {
        self.reader = FileReader(url: URL(fileURLWithPath: filename.replacingOccurrences(of: ".swift", with: ".txt")))!
        self.linesRead()
    }
    
    open func linesRead() {
        
    }
}
