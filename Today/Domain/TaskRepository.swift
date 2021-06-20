//
//  TaskRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation
import Combine

protocol TaskRepository {
    func findAll() -> Future<[Task], Error>
    
    @discardableResult
    func save(_: Task) -> Future<Void, Error>
}
