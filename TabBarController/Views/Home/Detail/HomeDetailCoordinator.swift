//
//  HomeDetailCoordinator.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import UIKit

final class HomeDetailCoordinator<R: HomeRouter> {
    let router: R

    lazy var primaryViewController: UIViewController = {
        let viewModel = HomeDetailViewModel<R>()
        viewModel.router = router
        let viewController = factory.makeHostingController(rootView: HomeDetailView(viewModel: viewModel))
        return viewController
    }()

    init(router: R) {
        self.router = router
    }
}

extension HomeDetailCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
