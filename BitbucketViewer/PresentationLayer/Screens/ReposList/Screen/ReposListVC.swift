//
//  ReposListVC.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

protocol ReposListVCOutput {
  func didTapOnRepo(in vc: UIViewController, repo: Repo)
}

class ReposListVC: ScreenController, ReposListViewDelegate, OverScreenLoaderDisplayable {
  
  // MARK: - UI elements
  
  private let selfView: ReposListView
  
  // MARK: - Dependencies
  
  var output: ReposListVCOutput!
  private let getReposService: GetReposService
  private let showErrorAlertService: ShowErrorAlertService
  
  // MARK: - Data
  
  private var nextPageDate: Date?
  
  // MARK: - Life cycle
  
  init(view: ReposListView,
       currentAppearanceService: AppearanceService,
       getReposService: GetReposService,
       showErrorAlertService: ShowErrorAlertService
  ) {
    selfView = view
    self.getReposService = getReposService
    self.showErrorAlertService = showErrorAlertService
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
    showOverScreenLoader()
    getReposService.getRepos(
      nextPageDate: nextPageDate,
      completion: { [weak self] result in
        guard let strongSelf = self else { return }
        DispatchQueue.main.async {
          strongSelf.hideOverScreenLoader()
          switch result {
            case .success(let data):
              strongSelf.displayReposListData(data)
            case .failure(let error):
              strongSelf.showErrorAlertService.showRepeatErrorAlert(
                message: error.message,
                in: strongSelf,
                onRepeat: {
                  strongSelf.loadReposListNextPage()
                }
              )
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
    output.didTapOnRepo(in: self, repo: repo)
  }
  
  func didTapOnNextButton() {
    loadReposListNextPage()
  }
}
