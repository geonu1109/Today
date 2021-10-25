//
//  PersonalName.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/25.
//

import Foundation

struct PersonalName: Equatable, CustomStringConvertible {
    var given: String
    
    var middle: String?
    
    var family: String
    
    var description: String {
        return "\(self.family), \([self.given, self.middle].compactMap { $0 }.joined(separator: " "))"
    }
    
    init(given: String, middle: String? = nil, family: String) {
        self.given = given
        self.middle = middle
        self.family = family
    }
}

extension PersonalName {
    struct Template: Codable {
        let families: [String]
        let males: [String]
        let females: [String]
        
        func randomFamily() -> String? {
            return self.families.randomElement()
        }
        
        func randomMale() -> String? {
            return self.males.randomElement()
        }
        
        func randomFemale() -> String? {
            return self.females.randomElement()
        }
        
        func randomMiddle(sex: Sex, isMarried: Bool) -> String? {
            switch sex {
            case .male:
                return self.randomMale()
            case .female:
                return isMarried ? randomFamily() : randomFemale()
            }
        }
        
        static func get(for culture: Culture) -> Self? {
            do {
                guard let url: URL = Bundle.main.url(forResource: "\(culture.name.lowercased())_personal_names", withExtension: "json") else {
                    return nil
                }
                let data: Data = try Data(contentsOf: url)
                return try JSONDecoder().decode(self, from: data)
            } catch {
                return nil
            }
        }
    }
}

extension PersonalName {
    class Maker {
        func randomKorean(sex: Sex) -> PersonalName {
            let template: Template = .get(for: .korean)!
            let givenName: String = sex == .male ? template.randomMale()! : template.randomFemale()!
            let familyName: String = template.families.randomElement()!
            return .init(given: givenName, family: familyName)
        }
        
        func randomAmerican(sex: Sex, isMarried: Bool) -> PersonalName {
            let template: Template = .get(for: .american)!
            let givenName: String = sex == .male ? template.randomMale()! : template.randomFemale()!
            let familyName: String = template.families.randomElement()!
            func randomMiddleName() -> String {
                return template.randomMiddle(sex: sex, isMarried: isMarried)!
            }
            var middleName: String = randomMiddleName()
            if middleName == familyName {
                middleName = randomMiddleName()
            }
            return .init(given: givenName, middle: middleName, family: familyName)
        }
    }
}

extension PersonalName {
    enum Order {
        case western
        case eastern
    }
}
