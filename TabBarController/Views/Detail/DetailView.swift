//
//  DetailView.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import SwiftUI

struct DetailView<T>: View where T: DetailViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Button("Go \(viewModel.title)") {
                viewModel.goToRoot()
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
            LinearGradient(gradient: Gradient(colors: viewModel.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("\(viewModel.title) Detail")
    }
}
