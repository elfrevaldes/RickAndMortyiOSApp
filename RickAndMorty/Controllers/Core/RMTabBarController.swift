//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 5/31/23.
//
//    public enum TabId {
//        case character(UIImage)
//        case location(UIImage)
//        case episodes(UIImage)
//        case settings(UIImage)
//        case notAvailable(UIImage)
//
//        public var description: String {
//            switch self {
//            case .character:
//                return "Character"
//            case .location:
//                return "Location"
//            case .episodes:
//                return "Episodes"
//            case .settings:
//                return "Settings"
//            case .notAvailable:
//                return "Not Available"
//            }
//        }
//
//        public static func toString(_ tabId: TabId) -> String {
//            switch tabId {
//            case .character:
//                return "Character"
//            case .location:
//                return "Location"
//            case .episodes:
//                return "Episodes"
//            case .settings:
//                return "Settings"
//            case .notAvailable:
//                return "Not Available"
//            }
//        }
//
//        public static func strToId(_ str: String) -> TabId {
//            if str == "character" {
//                return .character(UIImage(systemName: "person")!)
//            }
//            if (str == "location"){
//                return .location(UIImage(systemName: "globe")!)
//            }
//            if str == "episodes"{
//                return .episodes(UIImage(systemName: "tv")!)
//            }
//            if str == "settings" {
//                return .settings(UIImage(systemName: "gear")!)
//            }
//            return .notAvailable(UIImage(systemName: "questionmark.circle.fill")!)
//        }
//    }
    
    
//    func UnWrappedImage(str: String) -> UIImage {
//        if let imageName = str {
//                return UIImage(systemName: imageName) ?? UIImage(systemName: "questionmark.circle.fill")!
//            } else {
//                return UIImage(systemName: "questionmark.circle.fill")!
//            }
//        return imageName
//    }
//    func getImageForStringTabId(_ str: String) -> UIImage {
//        guard let tabIdString = str, let tabId = TabId(rawValue: tabIdString) else {
//            return UIImage(systemName: "questionmark.circle.fill")
//        }
//
        // switch tabId {
        
//        var tabId = TabId.strToId(str)
//        switch tabId {
//        case .character:
//            return UIImage(systemName: "person")!
//        case .location:
//            return UIImage(systemName: "globe")!
//        case .episodes:
//            return UIImage(systemName: "tv")!
//        case .settings:
//            return UIImage(systemName: "gear")!
//        default:
//            return UIImage(systemName: "questionmark.circle.fill")!
//        }
//    }

//    public var description: String {
//        switch self {
//        case .character:
//            return "character"
//        case .location:
//            return "location"
//        case .episodes:
//            return "episodes"
//        case .settings:
//            return "settings"
//        case .notAvailable:
//            return "notAvailable"
//        }
//    }
//
//    public func toString() -> String {
//        return description
//    }
//
// Another way to use a for loop
//        for (_, viewController) in tabsControllersList {
//            viewController.navigationItem.largeTitleDisplayMode = .automatic
//        }

import UIKit

public enum TabId: String {
    case character
    case location
    case episodes
    case settings
    case notAvailable
    
    public var image: UIImage {
        switch self {
        case .character:
            return UIImage(systemName: "person") ?? UIImage()
        case .location:
            return UIImage(systemName: "globe") ?? UIImage()
        case .episodes:
            return UIImage(systemName: "tv") ?? UIImage()
        case .settings:
            return UIImage(systemName: "gear") ?? UIImage()
        default:
            return UIImage(systemName: "questionmark.circle.fill") ?? UIImage()
        }
    }
    
    public func toImage() -> UIImage {
        return image
    }
    // Making this method Optional just so I can keep the example getImageFromString
    public static func fromString(_ str: String?) -> TabId? {
        // if the condition is false
        guard let str = str else { // "" => true => !true => false
            return .notAvailable
        }
        
        // work with lower case and return good value if not available
        return TabId(rawValue: str.lowercased()) ?? .notAvailable
    }
    public static func getImageFromString(_ str: String?) -> UIImage {
        // transforms the data and initializes to tabId which becomes available in the method
        guard let tabId = TabId.fromString(str) else {
            // if it can't perform the operation stop and return
            return TabId.notAvailable.image
        }
        return tabId.image
        
//      if let tabId = TabId.fromString(str) {
//          return tabId.image
//      } else {
//          return TabId.notAvailable.image
//      }
    }
}

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    private func setUpTabs() {
        let tabsControllersList = [
            RMCharacterViewController(title: TabId.character.rawValue.capitalized),
            RMLocationViewController(title: TabId.location.rawValue.capitalized),
            RMEpisodeViewController(title: TabId.episodes.rawValue.capitalized),
            RMSettingsViewController(title: TabId.settings.rawValue.capitalized),
            // RMSettingsViewController(title: "Test") // This was to check that our vc can take anything
        ]
        
        // setup title and image for tabs
        tabsControllersList.enumerated().forEach { (index, viewController) in
            viewController.navigationItem.largeTitleDisplayMode = .automatic
            viewController.tabBarItem = UITabBarItem(
                title: viewController.title,
                image: TabId.getImageFromString(viewController.title), // This variable is Optional and that is what makes
                tag: index)                                            // all methods accept optionals
        }
        

        //                                         x =>  or -> vc in tabContList
        let navTabList = tabsControllersList.map { viewController in
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.prefersLargeTitles = true
            return navigationController
        }
        setViewControllers(navTabList, animated: true)
    }
}
