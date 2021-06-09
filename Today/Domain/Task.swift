//
//  Task.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation

class Task: Entity, Codable {
    let id: UUID
    var content: String
    var isDone: Bool
    
    private init(id: UUID, content: String, isDone: Bool) {
        self.id = id
        self.content = content
        self.isDone = isDone
    }
    
    static func make(from content: String) -> Task {
        return .init(id: .init(), content: content, isDone: false)
    }
}


