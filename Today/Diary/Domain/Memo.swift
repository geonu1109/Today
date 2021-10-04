//
//  Memo.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

class Memo: Codable, ValueObject {
    let date: YearMonthDay
    var content: String
    
    var id: Int {
        return self.hashValue
    }
    
    static var empty: Memo {
        return .init(date: .today, content: "")
    }
    
    init(date: YearMonthDay = .today, content: String) {
        self.date = date
        self.content = content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.date)
        hasher.combine(self.content)
    }
}
