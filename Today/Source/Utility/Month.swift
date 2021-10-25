//
//  Month.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/04.
//

import Foundation

enum Month: Int, Codable {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

extension Month: Equatable {
    static func == (lhs: Month, rhs: Month) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Month: Comparable {
    static func < (lhs: Month, rhs: Month) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Month: CustomStringConvertible {
    var description: String {
        return self.rawValue.description
    }
}
