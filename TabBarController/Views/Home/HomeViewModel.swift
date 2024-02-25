//
//  HomeViewModel.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

protocol HomeViewModelRepresentable: ObservableObject {
    func goToDetail()
}

final class HomeViewModel<R: Router> {
    var router: R?
}

extension HomeViewModel: HomeViewModelRepresentable {
    func goToDetail() {
        if let router = router as? (any HomeRouter) {
            router.process(route: .detailScreen(title: "Home", gradientColors: [.green, .white]))
        }
    }
}
