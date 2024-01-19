//
//  ProfileTransition.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import Foundation

enum ProfileTransition {
    case initialScreen
    case detailScreen

    var identifier: String { "\(self)" }

    func coordinatorFor<R: ProfileRouter>(router: R) -> Coordinator {
        switch self {
        case .initialScreen:
            return ProfileCoordinator(router: router)
        case .detailScreen:
            return ProfileDetailCoordinator(router: router)
        }
    }
}
