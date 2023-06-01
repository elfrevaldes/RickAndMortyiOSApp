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
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest,
                        // When requesting with RMRequest we will get a result
                        completion: @escaping (Result<String, Error>) -> Void) {
        
    }
}
