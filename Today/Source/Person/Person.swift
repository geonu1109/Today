//
//  Person.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/24.
//

import Foundation

class Person: CustomStringConvertible {
    let culture: Culture
    let sex: Sex
    let personality: Personality
    let name: PersonalName
    
    var description: String {
        return "\(self.name) \(self.sex)\n\(self.personality)"
    }
    
    init(culture: Culture, sex: Sex, personality: Personality, name: PersonalName) {
        self.culture = culture
        self.sex = sex
        self.personality = personality
        self.name = name
    }
}

extension Person {
    class Maker {
        let personalNameMaker: PersonalName.Maker
        
        init(personalNameMaker: PersonalName.Maker) {
            self.personalNameMaker = personalNameMaker
        }
        
        func randomKorean() -> Person {
            let culture: Culture = .korean
            let sex: Sex = .random()
            let personality: Personality = .random()
            let name: PersonalName = self.personalNameMaker.randomKorean(sex: sex)
            return .init(culture: culture, sex: sex, personality: personality, name: name)
        }
        
        func randomAmerican() -> Person {
            let culture: Culture = .american
            let sex: Sex = .random()
            let personality: Personality = .random()
            let name: PersonalName = self.personalNameMaker.randomAmerican(sex: sex, isMarried: .random())
            return .init(culture: culture, sex: sex, personality: personality, name: name)
        }
    }
}
