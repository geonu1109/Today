//
//  Personality.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/25.
//

import Foundation

struct Personality: CustomStringConvertible {
    /// 경험에 대한 개방성
    let opennessToExperience: TraitLevel
    
    /// 성실성
    let conscientiousness: TraitLevel
    
    /// 외향성
    let extraversion: TraitLevel
    
    /// 우호성
    let agreeableness: TraitLevel
    
    /// 신경성
    let neuroticism: TraitLevel
    
    var description: String {
        return "O: \(self.opennessToExperience), C: \(self.conscientiousness), E: \(self.extraversion), A: \(self.agreeableness), N: \(self.neuroticism)"
    }
    
    static func random() -> Personality {
        return .init(
            opennessToExperience: .random(),
            conscientiousness: .random(),
            extraversion: .random(),
            agreeableness: .random(),
            neuroticism: .random()
        )
    }
}

enum TraitLevel: Int, Comparable, CustomStringConvertible {
    static func < (lhs: TraitLevel, rhs: TraitLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case veryLow = 1
    case low
    case middle
    case high
    case veryHigh
    
    var description: String {
        return self.rawValue.description
    }
    
    static func random() -> TraitLevel {
        let array: [Bool] = [.random(), .random(), .random(), .random()]
        return .init(rawValue: (array.filter { $0 }.count + 1))!
    }
}
