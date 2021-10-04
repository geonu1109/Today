//
//  MemoListViewModel.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

final class MemoListViewModel: ObservableObject {
    private let userDefaults: UserDefaults = .standard
    
    @Published
    var memoList: [Memo] = []
    
    func save() {
        do {
            let data = try JSONEncoder().encode(self.memoList)
            self.userDefaults.set(data, forKey: "Memo")
        } catch {
            
        }
    }
    
    func load() {
        do {
            guard let data = self.userDefaults.data(forKey: "Memo") else {
                return
            }
            let memoList = try JSONDecoder().decode([Memo].self, from: data)
                .reduce([Memo](), { partialResult, memo in
                    if partialResult.contains { $0.date == memo.date } {
                        return partialResult
                    } else {
                        return partialResult + [memo]
                    }
                })
            self.memoList = memoList.first?.date != .today
                ? ([Memo(date: .today, content: "")] + memoList)
                : memoList
        } catch {
            
        }
    }
}
