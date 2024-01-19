//
//  Coordinator.swift
//  TabBarController
//
//  Created by Byron on 14/1/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var factory: HostingControllerFactoryProtocol { get }
    func start()
}

extension Coordinator {
    var factory: HostingControllerFactoryProtocol {
        get {
            return SwiftUIHostingControllerFactory()
        }
    }
}
