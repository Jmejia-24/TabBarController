//
//  SwiftUIHostingControllerFactory.swift
//  TabBarController
//
//  Created by Byron on 19/1/24.
//

import UIKit
import SwiftUI

struct SwiftUIHostingControllerFactory: HostingControllerFactoryProtocol {
    func makeHostingController<Content>(rootView: Content) -> UIViewController where Content: View {
        UIHostingController(rootView: rootView)
    }
}
