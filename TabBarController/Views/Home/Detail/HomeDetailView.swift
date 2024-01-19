//
//  HomeDetailView.swift
//  TabBarController
//
//  Created by Byron on 16/1/24.
//

import SwiftUI

struct HomeDetailView<T>: View where T: HomeDetailViewModelRepresentable {
    @ObservedObject var viewModel: T

    var body: some View {
        VStack {
            Text("¡Home Detail!")
                .font(.title)
                .padding()
            Button("Back to Home") {
                viewModel.goTpHome()
            }
            .padding(10)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
             LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}
