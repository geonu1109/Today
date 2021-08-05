//
//  Memo.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

extension UUID {
    static var `nil`: UUID {
        UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
    }
}

struct Memo: Entity {
    let id: UUID
    let date: YearMonthDay
    let content: String
    
    static var empty: Memo {
        return .init(id: .nil, date: .today, content: "")
    }
    
    init(date: YearMonthDay = .today, content: String) {
        self.id = .init()
        self.date = date
        self.content = content
    }
    
    private init(id: UUID, date: YearMonthDay, content: String) {
        self.id = id
        self.date = date
        self.content = content
    }
}
