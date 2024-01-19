//
//  AppFlow.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

final class AppFlow {
    var navigationController = UINavigationController()
}

extension AppFlow: Coordinator {
    func start() {
        process(route: .showLogin)
    }
}

extension AppFlow: AppRouter {

    func exit() {
        // In this Router context - the only exit left is the main screen.
        // Logout - clean tokens - local cache - offline database if needed etc.
        process(route: .showLogin)
    }

    func process(route: AppTransition) {
        let coordinator = route.coordinatorFor(router: self)

        coordinator.start()

        print(route.identifier)
    }

    func resetToRoot(animated: Bool) -> Self {
        navigationController.popToRootViewController(animated: animated)
        return self
    }
}
