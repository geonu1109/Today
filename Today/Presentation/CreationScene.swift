//
//  CreationScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct CreationScene: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State
    var content: String = ""
    
    var body: some View {
        VStack {
            TextField("내용", text: self.$content)
            Spacer()
        }
        .padding()
        .navigationTitle("생성")
        .navigationBarItems(
            trailing: Button(action: self.done, label: {
                Image(systemName: "checkmark")
            })
        )
    }
    
    let repository = Container.shared.taskRepository
    
    func done() {
        let task: Task = .make(from: self.content)
        self.repository.save(task)
        self.presentationMode.wrappedValue.dismiss()
    }
}
