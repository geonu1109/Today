//
//  PersonTests.swift
//  TodayTests
//
//  Created by Geonu Jeon on 2021/10/25.
//

import XCTest
@testable import Today

class PersonTests: XCTestCase {
    func testRandom() {
        for i in 0 ..< 30 {
            let person: Person = .randomKorean()
            print(person)
        }
        for i in 0 ..< 30 {
            let person: Person = .randomAmerican()
            print(person)
        }
    }
    
    func testNames() {
        KoreanName.femaleGivenNames.forEach { (givenName) in
            let name: KoreanName = .init(familyName: "전", givenName: givenName)
            print(name)
        }
    }
}
