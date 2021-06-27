//
//  RepoUserDetailsVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class RepoUserDetailsVC: ScreenController {
  
  // MARK: - UI elements
  
  private let selfView: RepoUserDetailsView
  
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
}
