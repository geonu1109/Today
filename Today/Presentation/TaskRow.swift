//
//  TaskRow.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct TaskRow: View {
    @State
    var isDone: Bool {
        didSet {
            self.task.isDone = self.isDone
            self.repository.save(self.task)
        }
    }
    
    private let repository = Container.shared.taskRepository
    
    let task: Task
    
    var body: some View {
        Button(action: {
            self.isDone.toggle()
        }, label: {
            Label(title: {
                Text(self.task.content)
            }, icon: {
                Image(systemName: self.isDone ? "checkmark.square" : "square")
            })
        })
    }
    
    init(task: Task) {
        self.task = task
        self._isDone = .init(wrappedValue: task.isDone)
    }
}
