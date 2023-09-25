//
//  RootControllerCoordinator.swift
//  SenseyeFeatureFlag
//
//  Created by Akshay Tule on 24/09/23.
//

import UIKit
// Protocol to return a root view controller on basis of login session conditions or any other condition check.
protocol RootViewControllerProvider {
    var rootViewController: UIViewController { get }
}

// final class with an default app level functioanality implemented to decide a root view controller. The class has been marked final so that the functionality shall not be changed from anywhere else in code and maintain a basic behaviour of application launch at single place.
final class RootControllerCoordinator: RootViewControllerProvider {
    var rootViewController: UIViewController {
            let viewModel: HomeControllerViewModel = HomeControllerViewModel(
                // Initialize the view model with any required information
            )
            return HomeViewController(viewModel: viewModel)
    }
}
