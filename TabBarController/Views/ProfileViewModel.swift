//
//  ProfileViewModel.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import SwiftUI

protocol ProfileViewModelRepresentable: ObservableObject {
    func logOut()
    func goToDetail()
}

final class ProfileViewModel<R: Router> {
    var router: R?
}

extension ProfileViewModel: ProfileViewModelRepresentable {
    func goToDetail() {
        if let router = router as? (any ProfileRouter) {
            router.process(route: .detailScreen(title: "Profile", gradientColors: [.cyan, .white]))
        }
    }

    func logOut() {
        router?.exit()
    }
}
