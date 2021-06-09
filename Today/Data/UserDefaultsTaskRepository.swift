//
//  UserDefaultsTaskRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation
import Combine

final class UserDefaultsTaskRepository: TaskRepository {
    static let key = "Task"
    
    private let userDefaults: UserDefaults = .standard
    
    private let tasks: CurrentValueSubject<[Task], Never> = .init([])
    
    init() {
        let tasks: [Task] = {
            guard let data = self.userDefaults.data(forKey: Self.key) else {
                return []
            }
            do {
                return try JSONDecoder().decode([Task].self, from: data)
            } catch {
                return []
            }
        }()
        self.tasks.send(tasks)
    }
    
    func findAll() -> AnyPublisher<[Task], Never> {
        return self.tasks.eraseToAnyPublisher()
    }
    
    func save(_ task: Task) -> Result<Void, Error> {
        var tasks = self.tasks.value
        if let index = tasks.firstIndex(of: task) {
            tasks[index] = task
        } else {
            tasks.append(task)
        }
        do {
            let data = try JSONEncoder().encode(tasks)
            self.userDefaults.set(data, forKey: Self.key)
            self.tasks.send(tasks)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
