//
//  Record.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/21.
//

import Foundation

struct Record<Data> {
    var data: Data {
        didSet {
            self.modificationTime = Date()
        }
    }
    let creationTime: Date
    private(set) var modificationTime: Date
    
    init(_ data: Data) {
        self.data = data
        let currentTime = Date()
        self.creationTime = currentTime
        self.modificationTime = currentTime
    }
}

extension Record: Codable where Data: Codable {}
