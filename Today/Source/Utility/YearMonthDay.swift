//
//  YearMonthDay.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

struct YearMonthDay: Codable, ValueObject {
    var year: Int
    var month: Month
    var day: Int
    
    static var today: YearMonthDay {
        return .init(from: .init())
    }
    
    var isToday: Bool {
        return self == .today
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
    
    func toDate() -> Date {
        let dateComponents: DateComponents = .init(year: self.year, month: self.month.rawValue, day: self.day)
        return Calendar.current.date(from: dateComponents)!
    }
}

extension YearMonthDay: Equatable {
    static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
}

extension YearMonthDay: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.year)
        hasher.combine(self.month)
        hasher.combine(self.day)
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
