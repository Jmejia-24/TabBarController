//
//  HostingController.swift
//  TabBarController
//
//  Created by Byron on 17/1/24.
//

import UIKit
import SwiftUI

protocol HostingControllerFactoryProtocol {
    func makeHostingController<Content>(rootView: Content) -> UIViewController where Content: View
}
