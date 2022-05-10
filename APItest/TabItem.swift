//
//  TabItem.swift
//  CustomTabNavigation
//

import UIKit

@available(iOS 13.0, *)
enum TabItem: String, CaseIterable {
    case home = "home"
    case calender = "calender"
    case friends = "friends"
    case profile = "profile"
    
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return MainViewController()
        
        case .friends:
            return MainViewController()
        case .profile:
            return MainViewController()
        case .calender:
            return MainViewController()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "icon_home")!
        case .calender:
            return UIImage(named: "icon_calender")!
        case .friends:
            return UIImage(named: "icon_friends")!
        case .profile:
            return UIImage(named: "icon_profile")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
