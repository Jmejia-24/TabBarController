//
//  LoginViewModel.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

protocol LoginViewModelRepresentable: ObservableObject {
    func goHome()
}

final class LoginViewModel<R: AppRouter> {
    var router: R?
}

extension LoginViewModel: LoginViewModelRepresentable {
    func goHome() {
        router?.process(route: .showMainView(.profile(.initialScreen)))
    }
}
