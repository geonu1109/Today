//
//  MemoRowView.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import SwiftUI

struct MemoRowView: View {
    let memo: Memo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(self.memo.date.description)
                .foregroundColor(.secondary)
                .font(.caption)
            Text(self.memo.content)
                .foregroundColor(.primary)
                .font(.body)
        }
    }
    
    init(memo: Memo) {
        self.memo = memo
    }
}

struct MemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        MemoRowView(memo: .init(content: "안녕 세상"))
    }
}
