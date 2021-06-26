//
//  ReposListCoordinator.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ReposListCoordinator {
  
  // MARK: - Dependencies
  
  private let servicesFactory: ServicesFactory
  
  // MARK: - Life cycle
  
  init(servicesFactory: ServicesFactory) {
    self.servicesFactory = servicesFactory
  }
  
  // MARK: - Routing
  
  func showReposListScreen(window: UIWindow) {
    let navigationController = SwipeNavigationController()
    let vc = createReposListScreen()
    navigationController.viewControllers = [vc]
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  // MARK: - Screens creating
  
  private func createReposListScreen() -> UIViewController {
    let view = ReposListView()
    let vc = ReposListVC(
      view: view,
      currentAppearanceService: servicesFactory.createAppearanceService()
    )
    return vc
  }
}
