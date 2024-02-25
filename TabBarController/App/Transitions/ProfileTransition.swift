//
//  ProfileTransition.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import SwiftUI

enum ProfileTransition {
    case initialScreen
    case detailScreen(title: String, gradientColors: [Color])

    var identifier: String { "\(self)" }

    func coordinatorFor<R: ProfileRouter>(router: R) -> Coordinator {
        switch self {
        case .initialScreen:
            return ProfileCoordinator(router: router)
        case .detailScreen(let title, let gradientColors):
            return DetailCoordinator(router: router, title: title, gradientColors: gradientColors)
        }
    }
}
