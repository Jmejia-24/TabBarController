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

final class HomeViewModel<R: HomeRouter> {
    var router: R?
}
extension HomeViewModel: HomeViewModelRepresentable {
    func goToDetail() {
        router?.process(route: .detailScreen)
    }
}
