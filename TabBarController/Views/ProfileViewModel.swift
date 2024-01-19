//
//  ProfileViewModel.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

protocol ProfileViewModelRepresentable: ObservableObject {
    func logOut()
    func goToDetail()
}

final class ProfileViewModel<R: ProfileRouter> {
    var router: R?
}

extension ProfileViewModel: ProfileViewModelRepresentable {
    func goToDetail() {
        router?.process(route: .detailScreen)
    }
    
    func logOut() {
        router?.exit()
    }
}
