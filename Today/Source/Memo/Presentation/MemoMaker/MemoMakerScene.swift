//
//  MemoMakerScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/04.
//

import SwiftUI

struct MemoMakerViewState {
    var text: String
    
    var placeholder: String {
        return text.isEmpty ? "내용을 입력하세요." : ""
    }
}

struct MemoMakerScene: View {
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    let date: YearMonthDay
    let completion: (String) -> Void
    
    @State
    var state: MemoMakerViewState
    
    @FocusState
    var textEditorIsFocused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: self.$state.text)
                .focused(self.$textEditorIsFocused)
            Text(self.state.placeholder)
                .padding(8)
                .foregroundColor(.secondary)
        }
            .padding()
            .navigationTitle(self.date.description)
            .toolbar {
                Button {
                    self.completion(self.state.text)
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Text("저장")
                }

            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    self.textEditorIsFocused = true
                }
            }
    }
    
    init(date: YearMonthDay = .today, text: String = "", completion: @escaping (String) -> Void) {
        self.date = date
        self._state = .init(initialValue: .init(text: text))
        self.completion = completion
    }
}
