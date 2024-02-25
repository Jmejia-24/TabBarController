//
//  DetailCoordinator.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import SwiftUI

final class DetailCoordinator<R: Router> {
    let router: R
    private let title: String
    private let gradientColors: [Color]

    lazy var primaryViewController: UIViewController = {
        let viewModel = DetailViewModel<R>()
        viewModel.router = router
        viewModel.title = title
        viewModel.gradientColors = gradientColors

        let viewController = factory.makeHostingController(rootView: DetailView(viewModel: viewModel))
        return viewController
    }()

    init(router: R, title: String, gradientColors: [Color]) {
        self.router = router
        self.title = title
        self.gradientColors = gradientColors
    }
}

extension DetailCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
