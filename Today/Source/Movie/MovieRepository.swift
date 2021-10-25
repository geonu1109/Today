//
//  MovieRepository.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/12.
//

import Foundation

protocol MovieDataSource {
    func findAll(by date: YearMonthDay) async throws -> [Movie]
}

class MovieRepository: MovieDataSource {
    let client: MovieClient
    let dao: MovieDAO?
    
    init(client: MovieClient, dao: MovieDAO?) {
        self.client = client
        self.dao = dao
    }
    
    func findAll(by date: YearMonthDay) async throws -> [Movie] {
        if let dao = self.dao {
            if let result = dao.get(by: date) {
                return result
            } else {
                let result = try await self.client.get(by: date)
                try? dao.set(result, at: date)
                return result
            }
        } else {
            return try await self.client.get(by: date)
        }
    }
}

protocol MovieDAO {
    func set(_ movies: [Movie], at date: YearMonthDay) throws
    func get(by date: YearMonthDay) -> [Movie]?
}

class UserDefaultsMovieDAO: MovieDAO {
    let userDefaults: UserDefaults = .standard
    let key: String = String(describing: Movie.self)
    
    func set(_ movies: [Movie], at date: YearMonthDay) throws {
        let data: Data = try JSONEncoder().encode(movies)
        guard var dict = self.userDefaults.dictionary(forKey: self.key) as? [String: Data] else {
            let dict = [date.toDate().formatted("yyyy-MM-dd"): data]
            self.userDefaults.set(dict, forKey: self.key)
            return
        }
        dict[date.toDate().formatted("yyyy-MM-dd")] = data
        self.userDefaults.set(dict, forKey: self.key)
    }
    
    func get(by date: YearMonthDay) -> [Movie]? {
        guard let dict = self.userDefaults.dictionary(forKey: self.key) as? [String: Data] else {
            return nil
        }
        guard let data = dict[date.toDate().formatted("yyyy-MM-dd")] else {
            return nil
        }
        return try? JSONDecoder().decode([Movie].self, from: data)
    }
}
