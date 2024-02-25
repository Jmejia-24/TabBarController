//
//  ProfileView.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import SwiftUI

struct ProfileView<T>: View where T: ProfileViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Button("Log Out") {
                viewModel.logOut()
            }
            .padding(10)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Button("Go Profile Detail") {
                viewModel.goToDetail()
            }
            .padding(10)
            .background(
                LinearGradient(gradient: Gradient(colors: [.cyan, .blue]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.cyan, .white]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Profile")
    }
}
