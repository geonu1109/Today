//
//  Sex.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/25.
//

import Foundation

enum Sex: Equatable, CustomStringConvertible {
    case male
    case female
    
    var description: String {
        return self == .male ? "♂" : "♀"
    }
    
    static func random() -> Sex {
        return Bool.random() ? .male : .female
    }
}
