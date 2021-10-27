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
        let personMaker: Person.Maker = .init(personalNameMaker: .init())
        for i in 0 ..< 30 {
            let person: Person = personMaker.randomKorean()
            print(person)
        }
        for i in 0 ..< 30 {
            let person: Person = personMaker.randomAmerican()
            print(person)
        }
    }
    
    func testNames() {
        let koreanNameTemplate: PersonalName.Template = .get(for: .korean)!
        koreanNameTemplate.females.forEach { (givenName) in
            let name: PersonalName = .init(given: givenName, family: "Jeon")
            print(name)
        }
    }
    
    func testGeonu() {
        print(Person.geonu)
        print(Person.suhyeon)
    }
}
