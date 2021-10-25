//
//  TaskRow.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct TodoRow: View {
    @State
    var isDone: Bool {
        didSet {
            self.todo.isDone = self.isDone
            self.repository.save(self.todo)
        }
    }
    
    private let repository = Container.shared.todoRepository
    
    let todo: Todo
    
    var body: some View {
        Button(action: {
            self.isDone.toggle()
        }, label: {
            Label(title: {
                Text(self.todo.content)
            }, icon: {
                Image(systemName: self.isDone ? "checkmark.square" : "square")
            })
        })
    }
    
    init(todo: Todo) {
        self.todo = todo
        self._isDone = .init(wrappedValue: todo.isDone)
    }
}
