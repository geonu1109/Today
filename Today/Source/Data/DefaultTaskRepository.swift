//
//  DefaultTaskRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/21.
//

import Foundation
import Combine

final class DefaultTaskRepository: TodoRepository {
    private let localDataSource: UserDefaultsDataSource<Todo> = .init()
    
    func findAll() -> Future<[Todo], Error> {
        return .init { (promise) in
            do {
                let records = try self.localDataSource.findAll()
                let todos = records.map { $0.data }
                promise(.success(todos))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func save(_ todo: Todo) -> Future<Void, Error> {
        return .init { (promise) in
            do {
                try self.localDataSource.save(todo)
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
}
