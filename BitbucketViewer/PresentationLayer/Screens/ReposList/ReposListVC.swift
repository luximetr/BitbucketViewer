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
  
  private let getReposService: GetReposService
  
  // MARK: - Life cycle
  
  init(view: ReposListView,
       currentAppearanceService: AppearanceService,
       getReposService: GetReposService
  ) {
    selfView = view
    self.getReposService = getReposService
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
    prepareReposListData()
  }
  
  // MARK: - View - Setup
  
  private func setupView() {
    selfView.backgroundColor = .blue
  }
  
  // MARK: - Repos - Display
  
  private func prepareReposListData() {
    loadReposList()
  }
  
  private func loadReposList() {
    getReposService.getRepos(completion: { result in
      switch result {
        case .success(let repos): print(repos)
        case .failure(let error): print(error)
      }
    })
  }
}
