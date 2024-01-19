//
//  ProfileDetailCoordinator.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import UIKit

final class ProfileDetailCoordinator<R: ProfileRouter> {
    let router: R

    lazy var primaryViewController: UIViewController = {
        let viewModel = ProfileDetailViewModel<R>()
        viewModel.router = router
        let viewController = factory.makeHostingController(rootView: ProfileDetailView(viewModel: viewModel))
        return viewController
    }()

    init(router: R) {
        self.router = router
    }
}

extension ProfileDetailCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
