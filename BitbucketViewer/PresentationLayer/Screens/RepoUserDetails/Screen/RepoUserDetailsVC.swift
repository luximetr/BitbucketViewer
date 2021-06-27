//
//  RepoUserDetailsVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

protocol RepoUserDetailsVCOutput {
  func didTapOnBack(in vc: UIViewController)
  func didTapOnRepoUserWebsite(in vc: UIViewController, website: URL)
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
    displayDisplayName()
    displayWebsite()
    displayType()
    displayNickname()
  }
  
  private func displayDisplayName() {
    let title = getLocalizedString(key: "repo_user_details.display_name.title")
    let fullString = "\(title): \(repoUser.name ?? "")"
    selfView.displayName(fullString)
  }
  
  private func displayWebsite() {
    let title = getLocalizedString(key: "repo_user_details.website.title")
    let fullString = "\(title): \(repoUser.website?.absoluteString ?? "")"
    selfView.displayWebsite(fullString)
  }
  
  private func displayType() {
    let title = getLocalizedString(key: "repo_user_details.type.title")
    let fullString = "\(title): \(repoUser.type ?? "")"
    selfView.displayType(fullString)
  }
  
  private func displayNickname() {
    let title = getLocalizedString(key: "repo_user_details.nickname.title")
    let fullString = "\(title): \(repoUser.nickname ?? "")"
    selfView.displayNickname(fullString)
  }
  
  // MARK: - RepoUserDetailsViewDelegate
  
  func didTapOnBack() {
    output.didTapOnBack(in: self)
  }
  
  func didTapOnWebsite() {
    guard let website = repoUser.website else { return }
    output.didTapOnRepoUserWebsite(in: self, website: website)
  }
}
