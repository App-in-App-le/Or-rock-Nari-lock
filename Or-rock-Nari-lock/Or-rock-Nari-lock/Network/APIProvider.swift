//
//  APIProvider.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/17/24.
//

import Foundation

protocol Provider {
    func request<T: Decodable, E: Requestable&Responsable>(with endpoint: E, completion: @escaping (Result<T, NetworkError>) ->()) where E.Response == T
}

final class APIProvider: Provider {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<T: Decodable, E: Requestable&Responsable>(with endpoint: E, completion: @escaping (Result<T, NetworkError>) -> ()) where E.Response == T {
        do {
            let urlRequest = try endpoint.makeURLRequest()
            return request(from: urlRequest, completion: completion)
        } catch {
            completion(.failure(.urlRequestError))
        }
    }

    private func request<T: Decodable>(from urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> ()) {
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.urlRequestError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            
            self.decode(data: data, completion: completion)
            
        }.resume()
    }

    private func decode<T: Decodable>(data: Data, completion: (Result<T, NetworkError>) -> ()) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(.decodingError))
        }
    }
}
