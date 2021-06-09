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
    
    init() {
        self.repository.findAll()
            .assign(to: &self.$taskList)
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
                    destination: CreationScene(),
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
    }
}
