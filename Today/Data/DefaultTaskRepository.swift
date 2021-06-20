//
//  DefaultTaskRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/21.
//

import Foundation
import Combine

final class DefaultTaskRepository: TaskRepository {
    private let localDataSource: UserDefaultsDataSource<Task> = .init()
    
    func findAll() -> Future<[Task], Error> {
        return .init { (promise) in
            do {
                let records = try self.localDataSource.findAll()
                let tasks = records.map { $0.data }
                promise(.success(tasks))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func save(_ task: Task) -> Future<Void, Error> {
        return .init { (promise) in
            do {
                try self.localDataSource.save(task)
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
}
