//
//  MemoDetailView.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/05.
//

import SwiftUI

struct MemoDetailView: View {
    @State
    var date: Date
    
    @State
    var text: String
    
    @State
    var isEditing: Bool = false
    
    @FocusState
    var textEditorIsFocused: Bool
    
    let dateFormatter: DateFormatter = {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        return dateFormatter
    }()
    
    var body: some View {
        if self.isEditing {
            AnyView(self.editor)
        } else {
            AnyView(self.viewer)
        }
    }
    
    var editor: some View {
        TextEditor(text: self.$text)
            .focused(self.$textEditorIsFocused)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .lineSpacing(5)
            .padding(.all, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(self.date, formatter: self.dateFormatter)")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isEditing = false
                    } label: {
                        Text("저장")
                    }

                }
            }
    }
    
    var viewer: some View {
        ScrollView {
            Text(self.text)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .lineSpacing(5)
                .padding(.vertical, 28)
                .padding(.horizontal, 25)
        }
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    DatePicker("", selection: self.$date, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isEditing = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                            self.textEditorIsFocused = true
                        }
                    } label: {
                        Text("편집")
                    }

                }
            }
    }
    
    init(date: Date, text: String) {
        self._date = .init(initialValue: date)
        self._text = .init(initialValue: text)
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemoDetailView(date: .now, text: "hello world")
        }
    }
}
