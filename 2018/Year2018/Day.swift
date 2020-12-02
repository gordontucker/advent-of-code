//
//  Day.swift
//  Year2018
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

public class Day {
    let reader: Reader
    
    public init(reader: Reader) {
        self.reader = reader
    }
    
    public init(filename: String) {
        self.reader = FileReader(url: URL(fileURLWithPath: filename.replacingOccurrences(of: ".swift", with: ".txt")))!
    }
}
