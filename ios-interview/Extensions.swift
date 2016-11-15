//
//  Extensions.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/14/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func concatenate(with:Dictionary?) {
        guard let other = with else { return }
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
