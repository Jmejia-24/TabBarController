//
//  HomeView.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import SwiftUI

struct HomeView<T>: View where T: HomeViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Button("Go to Home Detail") {
                viewModel.goToDetail()
            }
            .padding(10)
            .background(
                LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Home")
    }
}
