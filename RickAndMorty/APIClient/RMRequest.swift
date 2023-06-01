//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/1/23.
//

import Foundation

/// Object that represent a single API call
final class RMRequest {
    
    // Base URL Example: https://rickandmortyapi.com/api/
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    // EndPoint that we are trying to reach
    private let endPoint: RMEndPoint
    // Query parameters
    private let queryParams: [URLQueryItem]
    // Folder Like for the request
    private let pathComponents: [String]
    
    
    /// Contructed url for the API request in String format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParams.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParams.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    
    /// Something
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    public init(endPoint: RMEndPoint, pathComponents: [String] = [], queryParams: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}
