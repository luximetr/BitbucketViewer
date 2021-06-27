//
//  RepoUserWebsiteCoordinator.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class RepoUserWebsiteCoordinator: RepoUserWebsiteVCOutput {
  
  // MARK: - Dependencies
  
  private let servicesFactory: ServicesFactory
  
  // MARK: - Life cycle
  
  init(servicesFactory: ServicesFactory) {
    self.servicesFactory = servicesFactory
  }
  
  // MARK: - Routing
  
  func showRepoUserWebsite(sourceVC: UIViewController, website: URL) {
    let vc = createRepoUserWebsiteVC(website: website)
    sourceVC.showScreen(vc, animation: .push)
  }
  
  // MARK: - RepoUserWebsiteVCOutput
  
  func didTapOnBack(in vc: UIViewController) {
    vc.closeScreen(animation: .pop)
  }
  
  // MARK: - Create screen
  
  private func createRepoUserWebsiteVC(website: URL) -> UIViewController {
    let view = RepoUserWebsiteView()
    let vc = RepoUserWebsiteVC(
      view: view,
      website: website,
      currentAppearanceService: servicesFactory.createAppearanceService()
    )
    vc.output = self
    view.delegate = vc
    return vc
  }
}
