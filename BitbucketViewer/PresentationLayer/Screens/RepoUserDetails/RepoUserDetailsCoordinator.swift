//
//  RepoUserDetailsCoordinator.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class RepoUserDetailsCoordinator {
  
  // MARK: - Dependencies
  
  private let servicesFactory: ServicesFactory
  
  // MARK: - Life cycle
  
  init(servicesFactory: ServicesFactory) {
    self.servicesFactory = servicesFactory
  }
  
  // MARK: - Routing
  
  func showRepoUserDetails(sourceVC: UIViewController, repoUser: RepoUser) {
    let vc = createRepoUserDetailsVC(repoUser: repoUser)
    sourceVC.showScreen(vc, animation: .push)
  }
  
  // MARK: - Create screen
  
  private func createRepoUserDetailsVC(repoUser: RepoUser) -> UIViewController {
    let view = RepoUserDetailsView(
      imageSetService: servicesFactory.createImageSetFromURLService()
    )
    let vc = RepoUserDetailsVC(
      view: view,
      repoUser: repoUser,
      currentAppearanceService: servicesFactory.createAppearanceService()
    )
    return vc
  }
}
