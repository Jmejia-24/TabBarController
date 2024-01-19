//
//  Router.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

protocol Router: AnyObject {
    associatedtype Route
    var navigationController: UINavigationController { get set }
    @discardableResult func resetToRoot(animated: Bool) -> Self
    func exit()
    func process(route: Route)
}

protocol AppRouter: Router where Route == AppTransition { }
protocol MainRouter: Router where Route == MainTransition { }
protocol HomeRouter: Router where Route == HomeTransition { }
protocol ProfileRouter: Router where Route == ProfileTransition { }
