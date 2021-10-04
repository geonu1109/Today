//
//  TodoRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation
import Combine

protocol TodoRepository {
    func findAll() -> Future<[Todo], Error>
    
    @discardableResult
    func save(_: Todo) -> Future<Void, Error>
}
