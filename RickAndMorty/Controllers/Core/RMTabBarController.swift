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

/// Houses the tabs and controls for the initial View
final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    private func setUpTabs() {
        let tabsControllersList = [
            RMCharacterViewController(title: RMEndPoint.character.rawValue.capitalized),
            RMLocationViewController(title: RMEndPoint.location.rawValue.capitalized),
            RMEpisodeViewController(title: RMEndPoint.episode.rawValue.capitalized),
            RMSettingsViewController(title: RMEndPoint.setting.rawValue.capitalized),
            RMSettingsViewController(title: "Anything") // This was to check that our vc can take anything
        ]
        
        // setup title and image for tabs
        tabsControllersList.enumerated().forEach { (index, viewController) in
            viewController.navigationItem.largeTitleDisplayMode = .automatic
            viewController.tabBarItem = UITabBarItem(
                title: viewController.title,
                image: RMEndPoint.getImageFromString(viewController.title), // This variable is Optional and that is what makes
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
