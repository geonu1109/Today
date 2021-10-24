//
//  Person.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/24.
//

import Foundation

struct Person: CustomStringConvertible {
    let name: PersonalName
    let personality: Personality
    let sex: Sex
    
    var description: String {
        return "\(self.name) \(self.sex)\n\(self.personality)"
    }
    
    static func randomKorean() -> Person {
        let sex: Sex = .random()
        return .init(name: KoreanName.random(sex: sex), personality: .random(), sex: sex)
    }
    
    static func randomAmerican() -> Person {
        let sex: Sex = .random()
        return .init(name: AmericanName.random(sex: sex), personality: .random(), sex: sex)
    }
}
