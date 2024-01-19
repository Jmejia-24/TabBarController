//
//  ProfileDetailViewModel.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import UIKit

protocol ProfileDetailViewModelRepresentable: ObservableObject {
    func goTpHome()
}

final class ProfileDetailViewModel<R: ProfileRouter> {
    var router: R?
}

extension ProfileDetailViewModel: ProfileDetailViewModelRepresentable {
    func goTpHome() {
        router?.resetToRoot(animated: true)
        router?.navigationController.tabBarController?.selectedIndex = 0
    }
}
