//
//  HomeDetailViewModel.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import UIKit

protocol HomeDetailViewModelRepresentable: ObservableObject {
    func goTpHome()
}

final class HomeDetailViewModel<R: HomeRouter> {
    var router: R?
}

extension HomeDetailViewModel: HomeDetailViewModelRepresentable {
    func goTpHome() {
        router?.resetToRoot(animated: true)
    }
}
