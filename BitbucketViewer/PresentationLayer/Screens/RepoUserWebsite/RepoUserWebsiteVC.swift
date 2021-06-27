//
//  RepoUserWebsiteVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

protocol RepoUserWebsiteVCOutput {
  func didTapOnBack(in vc: UIViewController)
}

class RepoUserWebsiteVC: ScreenController, RepoUserWebsiteViewDelegate {
  
  // MARK: - UI elements
  
  private let selfView: RepoUserWebsiteView
  
  // MARK: - Dependencies
  
  var output: RepoUserWebsiteVCOutput!
  
  // MARK: - Data
  
  private let website: URL
  
  // MARK: - Life cycle
  
  init(
    view: RepoUserWebsiteView,
    website: URL,
    currentAppearanceService: AppearanceService
  ) {
    selfView = view
    self.website = website
    super.init(
      screenView: view,
      currentAppearanceService: currentAppearanceService
    )
  }
  
  // MARK: - View - Life cycle
  
  override func loadView() {
    view = selfView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    selfView.displayWebsite(website)
  }
  
  // MARK: - RepoUserWebsiteViewDelegate
  
  func didTapOnBack() {
    output.didTapOnBack(in: self)
  }
}
