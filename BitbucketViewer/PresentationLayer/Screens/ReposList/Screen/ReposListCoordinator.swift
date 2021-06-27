//
//  ReposListCoordinator.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ReposListCoordinator: ReposListVCOutput {
  
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
  
  func showRepoUserDetailsScreen(sourceVC: UIViewController, repoUser: RepoUser) {
    let coordinator = RepoUserDetailsCoordinator(servicesFactory: servicesFactory)
    coordinator.showRepoUserDetails(sourceVC: sourceVC, repoUser: repoUser)
  }
  
  // MARK: - ReposListVCOutput
  
  func didTapOnRepo(in vc: UIViewController, repo: Repo) {
    showRepoUserDetailsScreen(sourceVC: vc, repoUser: repo.owner)
  }
  
  // MARK: - Screens creating
  
  private func createReposListScreen() -> UIViewController {
    let view = ReposListView(
      imageSetService: servicesFactory.createImageSetFromURLService(),
      appearanceService: servicesFactory.createAppearanceService()
    )
    let vc = ReposListVC(
      view: view,
      currentAppearanceService: servicesFactory.createAppearanceService(),
      getReposService: servicesFactory.createGetReposService(),
      showErrorAlertService: servicesFactory.createShowErrorAlertService()
    )
    vc.output = self
    view.delegate = vc
    return vc
  }
}
