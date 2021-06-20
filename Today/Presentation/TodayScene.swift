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
    var taskList: [Task] = []
    
    let repository = Container.shared.taskRepository
    
    private var asyncTask: AnyCancellable? = nil
    
    init() {
        self.fetch()
    }
    
    func fetch() {
        self.asyncTask?.cancel()
        
        self.asyncTask = self.repository.findAll()
            .sink { _ in
                self.asyncTask = nil
            } receiveValue: { (tasks) in
                self.taskList = tasks
            }
    }
}

struct TodayScene: View {
    @ObservedObject
    var viewModel: TodayViewModel = .init()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.taskList) { (task) in
                TaskRow(task: task)
            }
            .navigationTitle("오늘")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: CreationScene { (newTask) in
                        guard let newTask = newTask else {
                            return
                        }
                        self.viewModel.taskList.append(newTask)
                        self.viewModel.taskList = self.viewModel.taskList
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
    }
}
