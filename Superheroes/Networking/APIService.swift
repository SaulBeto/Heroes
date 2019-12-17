//
//  APIService.swift
//  Superheroes
//
//  Created by Saul Alberto Cortez Garcia on 12/13/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import Foundation

enum structEither<T> {
    case success(T)
    case error(Error)
}

enum APIError: Error {
    case badResponse, jsonDecoder, unknown
}

protocol APIService {
    var url: String { get}
    var session: URLSession { get }
    func get<T: Codable>(with request: URLRequest, completion: @escaping (structEither<T>) -> Void)
}


extension APIService {

    var session: URLSession { return URLSession.shared}
    
    /**
    Completion to make a Request.
    - Parameters:
        - request: The request to get de data.
        - completion: Generic type that return success or error response .
    */
    func get<T: Codable>(with request: URLRequest, completion: @escaping (structEither<T>) -> Void) {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                completion(.error(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(APIError.badResponse))
                return
            }

            guard let value = try? JSONDecoder().decode(T.self, from: data!) else {
                completion(.error(APIError.jsonDecoder))
                return
            }

            DispatchQueue.main.async {
                completion(.success(value))
            }
        }
        task.resume()
    }
}
