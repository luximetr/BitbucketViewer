//
//  FirstScreenService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class FirstScreenService {
  
  // MARK: - Dependencies
  
  private let window: UIWindow
  private let servicesFactory: ServicesFactory
  
  // MARK: - Life cycle
  
  init(window: UIWindow, servicesFactory: ServicesFactory) {
    self.window = window
    self.servicesFactory = servicesFactory
  }
  
  // MARK: - Routing
  
  func showFirstScreen() {
    let reposListCoordinator = ReposListCoordinator(servicesFactory: servicesFactory)
    reposListCoordinator.showReposListScreen(window: window)
  }
}
