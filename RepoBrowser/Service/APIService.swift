//
//  DataLoader.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 15/06/2019.
//

import Foundation
class APIService {
    
    var urlSession = URLSession.shared
    
    
    func fetch<T: Decodable>(_ endpoint: Endpoint, then handler: @escaping (Result<[T], APIServiceError>) -> Void) {
        guard let url = endpoint.url else {
            return handler(.failure(APIServiceError.invalidEndpoint))
        }
        
        let task = urlSession.dataTask(with: url) { data, _, error in
            guard let data = data else { return handler(.failure(APIServiceError.noData)) }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedObject = try decoder.decode([T].self, from: data)
                handler(.success(decodedObject))
            } catch let error {
                handler(.failure(APIServiceError.apiError(reason: error.localizedDescription)))
            }
        }
        
        task.resume()
    }
    
}

public enum APIServiceError: Error {
    case apiError(reason: String)
    case invalidEndpoint
    case noData
    case decodeError
}
