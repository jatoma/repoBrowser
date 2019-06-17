//
//  File.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 15/06/2019.
//

import Foundation
struct Endpoint {
    private let scheme = "https"
    private let base = "api.github.com"
    private let path: String
    private let queryItems: [URLQueryItem]

     var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = base
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}

extension Endpoint {
    static func repositories(resultsLimit: Int,
                       sortedBy sorting: Sorting = .lastUpdate) -> Endpoint {
        return Endpoint(
            path: "/users/applauseoss/repos",
            queryItems: [
                URLQueryItem(name: "per_page", value: String(resultsLimit)),
                URLQueryItem(name: "sort", value: sorting.rawValue)
            ]
        )
    }
}

extension Endpoint {
    func cacheKey() -> String? {
        return self.url?.path ?? nil
    }
}


enum Sorting: String {
    case stars = "stars"
    case lastUpdate = "updated"
}
