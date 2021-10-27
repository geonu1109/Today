//
//  Person.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/24.
//

import Foundation

class Person: CustomStringConvertible {
    let name: PersonalName
    let sex: Sex
    let birthDate: Date
    let personality: Personality
    let culture: Culture
    let religion: Religion?
    
    var age: Int {
        let calendar: Calendar = .init(identifier: .iso8601)
        return calendar.dateComponents([.year], from: self.birthDate, to: .now).year!
    }
    
    var description: String {
        return "\(self.name) (\(self.sex), \(self.age)) / \(self.culture.name), \(self.religion?.name ?? "None")\n\(self.personality)"
    }
    
    static let geonu: Person = .init(
        name: .init(given: "Geonu", family: "Jeon"),
        sex: .male,
        birthDate: {
            let dateComponent: DateComponents = .init(calendar: .init(identifier: .iso8601), year: 1991, month: 11, day: 9, hour: 23, minute: 24)
            return dateComponent.date!
        }(),
        personality: .init(opennessToExperience: .high, conscientiousness: .middle, extraversion: .middle, agreeableness: .middle, neuroticism: .low),
        culture: .korean,
        religion: nil
    )
    
    static let suhyeon: Person = .init(
        name: .init(given: "Suhyeon", family: "Byeon"),
        sex: .female,
        birthDate: {
            let dateComponent: DateComponents = .init(calendar: .init(identifier: .iso8601), year: 1989, month: 7, day: 18, hour: 16, minute: 47)
            return dateComponent.date!
        }(),
        personality: .init(opennessToExperience: .high, conscientiousness: .high, extraversion: .middle, agreeableness: .high, neuroticism: .low),
        culture: .korean,
        religion: nil
    )
    
    init(name: PersonalName, sex: Sex, birthDate: Date, personality: Personality, culture: Culture, religion: Religion?) {
        self.name = name
        self.sex = sex
        self.birthDate = birthDate
        self.personality = personality
        self.culture = culture
        self.religion = religion
    }
}

extension Person {
    class Maker {
        let personalNameMaker: PersonalName.Maker
        
        init(personalNameMaker: PersonalName.Maker) {
            self.personalNameMaker = personalNameMaker
        }
        
        func randomKorean() -> Person {
            let birthDate: Date = .now - .random(in: 3600 * 24 * 365 * 20 ... 3600 * 24 * 365 * 30)
            let culture: Culture = .korean
            let sex: Sex = .random()
            let personality: Personality = .random()
            let name: PersonalName = self.personalNameMaker.randomKorean(sex: sex)
            return .init(name: name, sex: sex, birthDate: birthDate, personality: personality, culture: culture, religion: nil)
        }
        
        func randomAmerican() -> Person {
            let birthDate: Date = .now - .random(in: 3600 * 24 * 365 * 20 ... 3600 * 24 * 365 * 30)
            let culture: Culture = .american
            let sex: Sex = .random()
            let personality: Personality = .random()
            let name: PersonalName = self.personalNameMaker.randomAmerican(sex: sex, isMarried: .random())
            return .init(name: name, sex: sex, birthDate: birthDate, personality: personality, culture: culture, religion: nil)
        }
    }
}
