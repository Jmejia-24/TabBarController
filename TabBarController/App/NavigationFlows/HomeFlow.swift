//
//  HomeFlow.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import UIKit

final class HomeFlow<R: AppRouter> {
    let router: R
    var navigationController = UINavigationController()

    init(router: R) {
        self.router = router
    }
}

extension HomeFlow: Coordinator {
    func start() {
        process(route: .initialScreen)
    }
}

extension HomeFlow: HomeRouter {

    func exit() {
        router.exit()
    }

    func process(route: HomeTransition) {
        let coordinator = route.coordinatorFor(router: self)

        coordinator.start()

        print(route.identifier)
    }

    func resetToRoot(animated: Bool) -> Self {
        navigationController.popToRootViewController(animated: animated)
        return self
    }
}
