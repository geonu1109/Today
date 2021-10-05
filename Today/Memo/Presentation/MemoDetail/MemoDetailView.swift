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
    
    let text: String
    
    var body: some View {
        ScrollView {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    DatePicker("날짜 선택", selection: self.$date, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Text("수정")
                    }

                }
            }
    }
    
    init(date: Date, text: String) {
        self._date = .init(initialValue: date)
        self.text = text
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemoDetailView(date: .now, text: "hello world")
        }
    }
}
