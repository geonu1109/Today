//
//  MemoListViewModel.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import Foundation

final class MemoListViewModel: ObservableObject {
    @Published
    private var _memoList: [Memo] = [
        .init(date: .init(year: 2021, month: .init(rawValue: 8)!, day: 5), content: "어제 일"),
        .init(date: .init(year: 2021, month: .init(rawValue: 8)!, day: 4), content: "엊그제 일")
    ]
    
    var memoList: [Memo] {
        if self._memoList.first?.date == .today {
            return self._memoList
        } else {
            return [.empty] + self._memoList
        }
    }
}
