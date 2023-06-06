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
    // Query arguments
    private let queryParams: [URLQueryItem]
    // Folder Like for the request
    /// Collection of modification of our path
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
    
    public var httpMethod: String {
        return "GET"
    }
    
    /// Computer  & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    /// Constructor for our Request
    /// - Parameters:
    ///   - endPoint: Target endpoint
    ///   - pathComponents: Collection used to request specific data
    ///   - queryParams: Simple modifiers for our request to filter for specific data
    public init(endPoint: RMEndPoint, pathComponents: [String] = [], queryParams: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}

extension RMRequest {
    static let characterListReq = RMRequest(endPoint: .character)
}
