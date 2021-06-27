//
//  ReposListVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ReposListVC: ScreenController, ReposListViewDelegate {
  
  // MARK: - UI elements
  
  private let selfView: ReposListView
  
  // MARK: - Dependencies
  
  private let getReposService: GetReposService
  
  // MARK: - Data
  
  private var nextPageDate: Date?
  
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
    loadReposListNextPage()
  }
  
  private func loadReposListNextPage() {
    getReposService.getRepos(
      nextPageDate: nextPageDate,
      completion: { [weak self] result in
        DispatchQueue.main.async {
          switch result {
            case .success(let data):
              self?.displayReposListData(data)
            case .failure(let error):
              print(error)
          }
        }
      }
    )
  }
  
  // MARK: - Repos list - Display data
  
  private func displayReposListData(_ data: GetReposService.Data) {
    nextPageDate = data.nextPageDate
    selfView.setNextButton(hidden: nextPageDate == nil)
    selfView.displayReposList(data.repos)
  }
  
  // MARK: - ReposListViewDelegate
  
  func didSelectRepo(_ repo: Repo) {
    print(repo.displayName)
  }
  
  func didTapOnNextButton() {
    loadReposListNextPage()
  }
}
