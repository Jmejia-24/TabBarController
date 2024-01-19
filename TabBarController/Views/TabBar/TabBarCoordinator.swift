//
//  TabBarCoordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

final class TabBarCoordinator<R: AppRouter>: NSObject, UITabBarControllerDelegate {
    let appRouter: R

    private var tabBarController: UITabBarController = {
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        tabBar.tabBar.isTranslucent = false
        return tabBar
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
            let homeRoute = HomeFlow(router: appRouter)
            let homeCoordinator = HomeCoordinator(router: homeRoute)
            homeCoordinator.start()

            homeRoute.navigationController.tabBarItem = getTabItem(transition)
            return homeRoute.navigationController
        case .profile:
            let profileRoute = ProfileFlow(router: appRouter)
            let profileCoordinator = ProfileCoordinator(router: profileRoute)
            profileCoordinator.start()

            profileRoute.navigationController.tabBarItem = getTabItem(transition)
            return profileRoute.navigationController
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
        if !appRouter.navigationController.viewControllers.isEmpty {
            appRouter.navigationController.viewControllers.removeAll()
        }

        let transitions: [MainTransition] = [.home(nil), .profile(nil)]
            .sorted(by: { $0.index < $1.index })

        let controllers: [UIViewController] = transitions.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
}
