//
//  TabBarCoordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

final class TabBarCoordinator<R: AppRouter>: NSObject, UITabBarControllerDelegate {
    let appRouter: R

    private lazy var tabBarController: UITabBarController = {
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        tabBar.tabBar.isTranslucent = false
        return tabBar
    }()

    private lazy var homeCoordinator: HomeCoordinator = {
        let homeRoute = HomeFlow(router: appRouter)
        let coordinator = HomeCoordinator(router: homeRoute)
        coordinator.start()
        return coordinator
    }()

    private lazy var profileCoordinator: ProfileCoordinator = {
        let profileRoute = ProfileFlow(router: appRouter)
        let coordinator = ProfileCoordinator(router: profileRoute)
        coordinator.start()
        return coordinator
    }()

    init(router: R) {
        self.appRouter = router
    }

    /// Creates a UITabBarItem from a given TabItem.
    /// - Parameter item: The TabItem to convert into a UITabBarItem.
    /// - Returns: A configured UITabBarItem.
    /// - Note: The `tag` property of the UITabBarItem is set to the index of the TabItem.
    private func tabBarItem(from item: TabItem) -> UITabBarItem {
        UITabBarItem(
            title: item.tabTitle,
            image: item.tabImage,
            tag: item.index
        )
    }

    /// Returns the appropriate view controller for a given TabItem.
    /// - Parameter transition: The TabItem to transition to.
    /// - Returns: A UIViewController corresponding to the TabItem.
    private func getTabController(for transition: TabItem) -> UIViewController {
        let navigationController: UINavigationController

        switch transition {
        case .home:
            navigationController = homeCoordinator.router.navigationController
        case .profile:
            navigationController = profileCoordinator.router.navigationController
        }

        navigationController.tabBarItem = tabBarItem(from: transition)
        return navigationController
    }

    /// Prepares and sets the main tab bar controller of the app.
    /// - Parameter tabControllers: An array of view controllers to be set in the tab bar.
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: false)

        if appRouter.navigationController.viewControllers.first !== tabBarController {
            appRouter.navigationController.viewControllers.removeAll()
            appRouter.navigationController.viewControllers = [tabBarController]
        }
    }
}

extension TabBarCoordinator: Coordinator {
    func start() {
        appRouter.navigationController.setNavigationBarHidden(true, animated: false)

        let transitions: [TabItem] = [.home(nil), .profile(nil)]

        let controllers: [UIViewController] = transitions.map({ getTabController(for: $0) })
        prepareTabBarController(withTabControllers: controllers)
    }
}
