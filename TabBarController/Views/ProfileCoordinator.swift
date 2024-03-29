//
//  ProfileCoordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import SwiftUI

final class ProfileCoordinator<R: Router> {
    let router: R

    init(router: R) {
        self.router = router
    }

    private lazy var primaryViewController: UIViewController = {
        let viewModel = ProfileViewModel<R>()
        viewModel.router = router

        let viewController = factory.makeHostingController(rootView: ProfileView(viewModel: viewModel))
        return viewController
    }()
}

extension ProfileCoordinator: Coordinator {
    func start() { 
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
