//
//  ValueObject.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

protocol ValueObject: Hashable, Identifiable {}

extension ValueObject {
    var id: Int {
        self.hashValue
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
