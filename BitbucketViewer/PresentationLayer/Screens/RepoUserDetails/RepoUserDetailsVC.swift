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
  
  // MARK: - Life cycle
  
  init(view: RepoUserDetailsView,
       currentAppearanceService: AppearanceService
  ) {
    selfView = view
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
    setup()
  }
  
  // MARK: - View - Setup
  
  private func setup() {
  }
}
