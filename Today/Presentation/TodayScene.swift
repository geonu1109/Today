//
//  TodayScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI
import Combine

final class TodayViewModel: ObservableObject {
    @Published
    var todoList: [Todo] = []
    
    let repository = Container.shared.todoRepository
    
    private var asyncTask: AnyCancellable? = nil
    
    init() {
        self.fetch()
    }
    
    func fetch() {
        self.asyncTask?.cancel()
        
        self.asyncTask = self.repository.findAll()
            .sink { _ in
                self.asyncTask = nil
            } receiveValue: { (todos) in
                self.todoList = todos
            }
    }
}

struct TodayScene: View {
    @ObservedObject
    var viewModel: TodayViewModel = .init()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.todoList) { (todo) in
                TodoRow(todo: todo)
            }
            .navigationTitle("오늘")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: CreationScene { (newTask) in
                        guard let newTask = newTask else {
                            return
                        }
                        self.viewModel.todoList.append(newTask)
                        self.viewModel.todoList = self.viewModel.todoList
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
    }
}
