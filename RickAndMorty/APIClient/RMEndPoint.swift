//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/1/23.
//

import Foundation
import UIKit

/// Represent Unique API endpoints
public enum RMEndPoint: String {
    case character
    case location
    case episode
    case setting
    case notAvailable
    
    public var image: UIImage {
        switch self {
        case .character:
            return UIImage(systemName: "person") ?? UIImage()
        case .location:
            return UIImage(systemName: "globe") ?? UIImage()
        case .episode:
            return UIImage(systemName: "tv") ?? UIImage()
        case .setting:
            return UIImage(systemName: "gear") ?? UIImage()
        default:
            return UIImage(systemName: "questionmark.circle.fill") ?? UIImage()
        }
    }
    
    public func toImage() -> UIImage {
        return image
    }
    // Making this method Optional just so I can keep the example getImageFromString
    public static func fromString(_ str: String?) -> RMEndPoint? {
        // if the condition is false
        guard let str = str else { // "" => true => !true => false
            return .notAvailable
        }
        
        // work with lower case and return good value if not available
        return RMEndPoint(rawValue: str.lowercased()) ?? .notAvailable
    }
    public static func getImageFromString(_ str: String?) -> UIImage {
        // transforms the data and initializes to tabId which becomes available in the method
        guard let tabId = RMEndPoint.fromString(str) else {
            // if it can't perform the operation stop and return
            return RMEndPoint.notAvailable.image
        }
        return tabId.image
        
//      if let tabId = TabId.fromString(str) {
//          return tabId.image
//      } else {
//          return TabId.notAvailable.image
//      }
    }
}
