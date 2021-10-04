//
//  MemoListScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/08/06.
//

import SwiftUI

struct MemoListScene: View {
    @ObservedObject
    private var viewModel: MemoListViewModel = .init()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.memoList) { (memo) in
                NavigationLink {
                    MemoMakerScene(date: memo.date, text: memo.content) {
                        memo.content = $0
                        self.viewModel.objectWillChange.send()
                        self.viewModel.save()
                    }
                } label: {
                    if memo == .empty {
                        EmptyMemoRowView()
                    } else {
                        MemoRowView(memo: memo)
                    }
                }
            }
            .navigationTitle("다이어리")
            .onAppear {
                self.viewModel.load()
            }
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
    }
}
