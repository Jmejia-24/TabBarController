//
//  TabItem.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import UIKit

enum TabItem {
    case home(HomeTransition?)
    case profile(ProfileTransition?)

    var tabTitle: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        }
    }

    var index: Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        }
    }

    var tabImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")
        case .profile:
            return UIImage(systemName: "person.fill")
        }
    }
}
