//
//  Movie.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/12.
//

import Foundation

struct Movie: Codable, ValueObject {
    static let example: Movie = .init(code: "20191061", rank: 1, name: "007 노 타임 투 다이", releaseDate: .init(year: 2021, month: .september, day: 29), audienceNumber: 67420, audienceNumberChange: -28577)
    
    let code: String
    let rank: Int
    let name: String
    let releaseDate: YearMonthDay
    let audienceNumber: Int
    let audienceNumberChange: Int
}
