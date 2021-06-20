//
//  CreationScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI
import Combine

struct CreationScene: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State
    var content: String = ""
    
    let completion: (Task?) -> Void
    
    let repository = Container.shared.taskRepository
    
    @State
    var asyncTask: AnyCancellable? = nil
    
    var body: some View {
        VStack {
            TextField("내용", text: self.$content)
            Spacer()
        }
        .padding()
        .navigationTitle("생성")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: self.back, label: {
                Image(systemName: "chevron.left")
            }),
            trailing: Button(action: self.done, label: {
                Image(systemName: "checkmark")
            })
        )
    }
    
    func back() {
        self.completion(nil)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func done() {
        self.asyncTask?.cancel()
        
        let task: Task = .make(from: self.content)
        self.asyncTask = self.repository.save(task)
            .sink { (completion) in
                self.asyncTask = nil
                switch completion {
                case .finished:
                    self.completion(task)
                    self.presentationMode.wrappedValue.dismiss()
                case .failure(let error):
                    // not implemented
                    break
                }
            } receiveValue: { _ in
                // do nothing
            }
    }
}
