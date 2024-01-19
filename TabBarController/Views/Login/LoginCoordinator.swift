//
//  LoginCoordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

final class LoginCoordinator<R: AppRouter> {
    let router: R

    private lazy var primaryViewController: UIViewController = {
        let viewModel = LoginViewModel<R>()
        viewModel.router = router
        let viewController = factory.makeHostingController(rootView: LoginView(viewModel: viewModel))
        return viewController
    }()

    init(router: R) {
        self.router = router
    }
}

extension LoginCoordinator: Coordinator {
    func start() {
        router.navigationController.viewControllers.removeAll()
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
