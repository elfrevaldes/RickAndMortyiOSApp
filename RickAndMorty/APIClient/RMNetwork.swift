//
//  RMService.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/1/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMNetwork: Decodable {
    /// Shared singleton instance
    static let service = RMNetwork()
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Generic Call that can return all type of request
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    ///   - type: The type of object that we will be constructing
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        // When requesting with RMRequest we will get a result based on the request type
        completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        // send of the request                                  _ is the response
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            // this is a and statement (we have data and no error)
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToCreateRequest))
                return
            }
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        
        return request
    }
    /// Privatized constructor
    private init() {}
}
