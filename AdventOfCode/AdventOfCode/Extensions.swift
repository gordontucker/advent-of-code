//
//  Extensions.swift
//  AdventOfCode
//
//  Created by Gordon Tucker on 12/3/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import UIKit

extension Array where Element == Int {
    func sum() -> Int { return self.reduce(0, { $0 + $1 }) }
}
