//
//  HomeTransition.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import SwiftUI

enum HomeTransition {
    case initialScreen
    case detailScreen(title: String, gradientColors: [Color])

    var identifier: String { "\(self)" }

    func coordinatorFor<R: HomeRouter>(router: R) -> Coordinator {
        switch self {
        case .initialScreen:
            return HomeCoordinator(router: router)
        case .detailScreen(let title, let gradientColors):
            return DetailCoordinator(router: router, title: title, gradientColors: gradientColors)
        }
    }
}
