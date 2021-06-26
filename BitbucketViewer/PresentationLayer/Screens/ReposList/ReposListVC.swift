//
//  ReposListVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ReposListVC: ScreenController {
  
  // MARK: - UI elements
  
  private let selfView: ReposListView
  
  // MARK: - Dependencies
  
  // MARK: - Life cycle
  
  init(view: ReposListView,
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
    setupView()
  }
  
  // MARK: - View - Setup
  
  private func setupView() {
    selfView.backgroundColor = .blue
  }
}
