//
//  ProfileDetailView.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import SwiftUI

struct ProfileDetailView<T>: View where T: ProfileDetailViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Text("¡Profile Detail!")
                .font(.title)
                .padding()
            Button("Go Home") {
                viewModel.goTpHome()
            }
            .padding(10)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.cyan, .white]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}
