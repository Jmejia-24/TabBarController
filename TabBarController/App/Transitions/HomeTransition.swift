//
//  HomeTransition.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import Foundation

enum HomeTransition {
    case initialScreen
    case detailScreen

    var identifier: String { "\(self)" }

    func coordinatorFor<R: HomeRouter>(router: R) -> Coordinator {
        switch self {
        case .initialScreen:
            return HomeCoordinator(router: router)
        case .detailScreen:
            return HomeDetailCoordinator(router: router)
        }
    }
}
