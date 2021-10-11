//
//  MovieClient.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/11.
//

import Foundation

protocol MovieClient {
    func get() async throws -> Data
}

extension Date {
    func formatted(_ dateFormat: String) -> String {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}


/// KOBIS: 영화관입장권통합전산망
class KOBISMovieClient: MovieClient {
    let session: URLSession = .shared
    
    let key: String = "9d3c963d19b3995b661e724720414b4c"
    
    func get() async throws -> Data {
        var urlComponents: URLComponents = .init()
        urlComponents.scheme = "http"
        urlComponents.host = "www.kobis.or.kr"
        urlComponents.path = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        urlComponents.queryItems = try {
            let date: Date = .now - 24 * 3600
            let body: BoxOfficeRequest = .init(key: self.key, targetDt: date.formatted("yyyyMMdd"), itemPerPage: nil, multiMovieYn: nil, repNationCd: nil, wideAreaCd: nil)
            let data = try JSONEncoder().encode(body)
            guard let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                return nil
            }
            return dict.map { URLQueryItem(name: $0, value: "\($1)") }
        }()
        print(urlComponents.url!)
        return try await self.session.data(from: urlComponents.url!, delegate: nil).0
    }
}

/// key: 발급받은키 값을 입력합니다.
/// targetDt: 조회하고자 하는 날짜를 yyyymmdd 형식으로 입력합니다.
/// itemPerPage: 결과 ROW 의 개수를 지정합니다.(default : “10”, 최대 : “10“)
/// multiMovieYn: 다양성 영화/상업영화를 구분지어 조회할 수 있습니다. “Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
/// repNationCd: 한국/외국 영화별로 조회할 수 있습니다. “K: : 한국영화 “F” : 외국영화 (default : 전체)
/// wideAreaCd: 상영지역별로 조회할 수 있으며, 지역코드는 공통코드 조회 서비스에서 “0105000000” 로서 조회된 지역코드입니다. (default : 전체)
struct BoxOfficeRequest: Codable {
    let key: String
    let targetDt: String
    let itemPerPage: String?
    let multiMovieYn: String?
    let repNationCd: String?
    let wideAreaCd: String?
}
