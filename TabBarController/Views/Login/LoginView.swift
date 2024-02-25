//
//  LoginView.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import SwiftUI

struct LoginView<T>: View where T: LoginViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Button("Go to Home") {
                viewModel.goHome()
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            BlurView(style: .extraLight)
                .background(Color.blue)
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Login")
    }
}
