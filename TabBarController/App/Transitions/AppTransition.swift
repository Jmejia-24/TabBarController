//
//  AppTransition.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

enum AppTransition {
    case showLogin
    case showMainView(MainTransition)

    var identifier: String { "\(self)" }

    func coordinatorFor<R: AppRouter>(router: R) -> Coordinator {
        switch self {
        case .showLogin:
            return LoginCoordinator(router: router)
        case .showMainView:
            return TabBarCoordinator(router: router)
        }
    }
}
