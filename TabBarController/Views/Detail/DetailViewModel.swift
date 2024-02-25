//
//  ProfileDetailViewModel.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import SwiftUI

protocol DetailViewModelRepresentable: ObservableObject {
    var gradientColors: [Color] { get }
    var title: String { get }
    func goToRoot()
}

final class DetailViewModel<R: Router> {
    var router: R?
    var title = ""
    var gradientColors: [Color] = []
}

extension DetailViewModel: DetailViewModelRepresentable {
    func goToRoot() {
        router?.resetToRoot(animated: true)
    }
}
