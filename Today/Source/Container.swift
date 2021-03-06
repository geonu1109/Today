//
//  Container.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation

final class Container {
    static let shared: Container = .init()
    
    var todoRepository: TodoRepository = DefaultTaskRepository()
    
    private init() {}
}
