//
//  YearMonthDay.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

struct YearMonthDay: ValueObject {
    var year: Int
    var month: Int
    var day: Int
    
    static var today: YearMonthDay {
        return .init(from: .init())
    }
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    init(from date: Date) {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        self.year = dateComponents.year!
        self.month = dateComponents.month!
        self.day = dateComponents.day!
    }
}

extension YearMonthDay: CustomStringConvertible {
    var description: String {
        return "\(self.year)년 \(self.month)월 \(self.day)일"
    }
}
