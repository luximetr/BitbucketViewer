//
//  RepoUserDetailsVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

protocol RepoUserDetailsVCOutput {
  func didTapOnBack(in vc: UIViewController)
}

class RepoUserDetailsVC: ScreenController, RepoUserDetailsViewDelegate {
  
  // MARK: - UI elements
  
  private let selfView: RepoUserDetailsView
  
  // MARK: - Dependencies
  
  var output: RepoUserDetailsVCOutput!
  
  // MARK: - Data
  
  private let repoUser: RepoUser
  
  // MARK: - Life cycle
  
  init(view: RepoUserDetailsView,
       repoUser: RepoUser,
       currentAppearanceService: AppearanceService
  ) {
    selfView = view
    self.repoUser = repoUser
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
    displayDetails()
  }
  
  // MARK: - Repo user - Display
  
  private func displayDetails() {
    selfView.displayAvatar(repoUser.avatar)
    selfView.displayName("Display name: \(repoUser.name ?? "")")
    selfView.displayWebsite("Website: \(repoUser.website?.absoluteString ?? "")")
    selfView.displayType("Type: \(repoUser.type ?? "")")
    selfView.displayNickname("Nickname: \(repoUser.nickname ?? "")")
  }
  
  // MARK: - RepoUserDetailsViewDelegate
  
  func didTapOnBack() {
    output.didTapOnBack(in: self)
  }
}
