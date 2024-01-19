//
//  MainTransition.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import UIKit

enum MainTransition {
    case home(HomeTransition?)
    case profile(ProfileTransition?)

    var identifier: String { "\(self)" }

    var titleValue: String {
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

    var image: UIImage? {
        switch self {
        case .home:
            return .init(systemName: "house.fill")
        case .profile:
            return .init(systemName: "person.fill")
        }
    }
}
