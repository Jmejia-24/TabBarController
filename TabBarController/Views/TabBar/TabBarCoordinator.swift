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

    private func getTabItem(_ transition: MainTransition) -> UITabBarItem {
        UITabBarItem(
            title: transition.titleValue,
            image: transition.image,
            tag: transition.index
        )
    }

    private func getTabController(_ transition: MainTransition) -> UIViewController {
        appRouter.navigationController.setNavigationBarHidden(true, animated: false)

        switch transition {
        case .home:
            homeCoordinator.router.navigationController.tabBarItem = getTabItem(transition)
            return homeCoordinator.router.navigationController
        case .profile:
            profileCoordinator.router.navigationController.tabBarItem = getTabItem(transition)
            return profileCoordinator.router.navigationController
        }
    }

    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: false)

        appRouter.navigationController.viewControllers.removeAll()
        appRouter.navigationController.viewControllers = [tabBarController]
    }
}

extension TabBarCoordinator: Coordinator {
    func start() {
        let transitions: [MainTransition] = [.home(nil), .profile(nil)]
            .sorted(by: { $0.index < $1.index })

        let controllers: [UIViewController] = transitions.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
}
