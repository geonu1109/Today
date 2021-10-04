//
//  YearMonthDay.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

struct YearMonthDay: ValueObject {
    var year: Int
    var month: Month
    var day: Int
    
    static var today: YearMonthDay {
        return .init(from: .init())
    }
    
    init(year: Int, month: Month, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    init(from date: Date) {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        self.year = dateComponents.year!
        self.month = .init(rawValue: dateComponents.month!)!
        self.day = dateComponents.day!
    }
}

extension YearMonthDay: Equatable {
    static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
}

extension YearMonthDay: Comparable {
    static func < (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        if lhs.year == rhs.year {
            if lhs.month == rhs.month {
                return lhs.day < rhs.day
            } else {
                return lhs.month < rhs.month
            }
        } else {
            return lhs.year < rhs.year
        }
    }
}

extension YearMonthDay: CustomStringConvertible {
    var description: String {
        return "\(self.year)년 \(self.month)월 \(self.day)일"
    }
}
