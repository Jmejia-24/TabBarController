//
//  HomeCoordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

final class HomeCoordinator<R: HomeRouter> {
    let router: R

    init(router: R) {
        self.router = router
    }

    private lazy var primaryViewController: UIViewController = {
        let viewModel = HomeViewModel<R>()
        viewModel.router = router
        let viewController = factory.makeHostingController(rootView: HomeView(viewModel: viewModel))
        return viewController
    }()
}

extension HomeCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
