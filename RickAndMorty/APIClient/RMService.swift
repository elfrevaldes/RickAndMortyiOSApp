//
//  RMService.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/1/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API Generic Call that can return all type of request
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    ///   - type: The type of object that we will be constructing
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        // When requesting with RMRequest we will get a result based on the request type
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
