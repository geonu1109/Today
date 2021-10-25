//
//  UserDefaultsDataSource.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/21.
//

import Foundation
import Combine

final class UserDefaultsDataSource<Object>
where Object: Identifiable & Codable, Object.ID: Codable
{
    typealias ObjectRecord = Record<Object>
    
    let userDefaults: UserDefaults
    
    let key: String
    
    init(
        userDefaults: UserDefaults = .standard,
        key: String = String(describing: Object.self)
    ) {
        self.userDefaults = userDefaults
        self.key = key
    }
    
    func findAll() throws -> [ObjectRecord] {
        return try self._findAll().values.sorted { $0.creationTime < $1.creationTime }
    }
    
    func find(by id: Object.ID) throws -> ObjectRecord? {
        return try self._findAll()[id]
    }
    
    @discardableResult
    func save(_ object: Object) throws -> ObjectRecord {
        let record: ObjectRecord = try {
            if var record = try self.find(by: object.id) {
                record.data = object
                return record
            } else {
                return .init(object)
            }
        }()
        var dict = try self._findAll()
        dict[object.id] = record
        try self._saveAll(dict)
        return record
    }
    
    private func _findAll() throws -> [Object.ID: ObjectRecord] {
        guard let data: Data = self.userDefaults.data(forKey: self.key) else {
            return [:]
        }
        do {
            return try JSONDecoder().decode([Object.ID: ObjectRecord].self, from: data)
        } catch {
            throw error
        }
    }
    
    private func _saveAll(_ dict: [Object.ID: ObjectRecord]) throws {
        let data = try JSONEncoder().encode(dict)
        self.userDefaults.setValue(data, forKey: self.key)
    }
}
