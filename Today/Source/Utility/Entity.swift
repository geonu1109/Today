//
//  Entity.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation

protocol Entity: Identifiable, Equatable {}

extension Entity {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
