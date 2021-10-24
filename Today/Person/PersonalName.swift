//
//  PersonalName.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/25.
//

import Foundation

protocol PersonalName: CustomStringConvertible {
    var familyName: String { get }
    var givenName: String { get }
}

struct AmericanName: PersonalName {
    static let familyNames: [String] = [
        "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
        "Hernandez", "Lopez", "Gonzales", "Wilson", "Anderson", "Tomas", "Taylor", "Moore", "Jackson", "Martin"
    ]
    
    static let maleGivenNames: [String] = [
        "Liam", "Noah", "Oliver", "Elijah", "Lucas", "Levi", "Mason", "James", "Asher", "Mateo",
        "Ethan", "Leo", "Benjamin", "Jack", "Aiden", "Logan", "Grayson", "Leriel", "Jackson", "Henry"
    ]
    
    static let femaleGivenNames: [String] = [
        "Olivia", "Emma", "Amelia", "Ava", "Sophia", "Charlotte", "Isabella", "Mia", "Luna", "Harper",
        "Gianna", "Evelyn", "Aria", "Ella", "Ellie", "Mila", "Layla", "Avery", "Ryilee", "Camila"
    ]
    
    var familyName: String
    var givenName: String
    
    var description: String {
        return "\(self.givenName) \(self.familyName)"
    }
    
    static func random(sex: Sex) -> AmericanName {
        switch sex {
        case .male:
            return .init(familyName: familyNames.randomElement()!, givenName: maleGivenNames.randomElement()!)
        case .female:
            return .init(familyName: familyNames.randomElement()!, givenName: femaleGivenNames.randomElement()!)
        }
    }
}

struct KoreanName: PersonalName {
    static let familyNames: [String] = [
        "김", "이", "박", "최", "정", "강", "조", "윤", "장", "임",
        "한", "오", "서", "신", "권", "황", "안", "송", "전", "홍"
    ]
    
    static let maleGivenNames: [String] = [
        "이준", "서준", "하준", "도윤", "은우", "시우", "지호", "예준", "수호", "유준",
        "로운", "이안", "선우", "민준", "주원", "준우", "건우", "연우", "도현", "서진"
    ]
    
    static let femaleGivenNames: [String] = [
        "서아", "하윤", "이서", "지아", "지안", "서윤", "아윤", "아린", "하은", "하린",
        "시아", "지우", "나은", "수아", "지유", "서하", "서우", "서연", "유나", "하율"
    ]
    
    var familyName: String
    var givenName: String
    
    var description: String {
        return "\(self.familyName)\(self.givenName)"
    }
    
    static func random(sex: Sex) -> KoreanName {
        switch sex {
        case .male:
            return .init(familyName: familyNames.randomElement()!, givenName: maleGivenNames.randomElement()!)
        case .female:
            return .init(familyName: familyNames.randomElement()!, givenName: femaleGivenNames.randomElement()!)
        }
    }
}
