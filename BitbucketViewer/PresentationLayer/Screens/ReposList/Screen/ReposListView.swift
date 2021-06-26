//
//  ReposListView.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ReposListView: ScreenNavigationBarView, AppearanceConfigurable {
  
  // MARK: - UI elements
  
  private let tableView = UITableView()
  
  // MARK: - Dependencies
  
  private let imageSetService: ImageSetFromURLService
  private var createdOnFormatter = DateFormatter()
  
  // MARK: - Controllers
  
  private let tableViewController = TableViewController()
  
  // MARK: - Life cycle
  
  init(imageSetService: ImageSetFromURLService) {
    self.imageSetService = imageSetService
    createdOnFormatter.dateFormat = "dd MMM yyyy"
    super.init(frame: .zero)
  }
  
  // MARK: - List - Display
  
  func displayReposList(_ repos: [Repo]) {
    let cells = createReposCells(repos)
    tableViewController.reloadItems(cells, animated: false)
  }
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    setupTableView()
    setupTableViewController()
  }
  
  // MARK: - AutoLayout
  
  override func autoLayout() {
    super.autoLayout()
    addSubview(tableView)
    autoLayoutTableView()
  }
  
  // MARK: - Appearance
  
  override func setAppearance(_ appearance: Appearance) {
    super.setAppearance(appearance)
    setTableViewAppearance(appearance: appearance)
  }
  
  // MARK: - Setup tableView
  
  private func setupTableView() {
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
  }
  
  private func setTableViewAppearance(appearance: Appearance) {
    tableView.backgroundColor = appearance.background.primary
    tableView.indicatorStyle = appearance.scrollIndicator.style
  }
  
  private func autoLayoutTableView() {
    tableView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(navigationBarView.snp.bottom)
    }
  }
  
  // MARK: - Setup tableViewController
  
  private func setupTableViewController() {
    tableViewController.tableView = tableView
  }
  
  // MARK: - Repos - Create cells
  
  private func createReposCells(_ repos: [Repo]) -> [TableCellConfigurator] {
    return repos.compactMap { createRepoCell($0) }
  }
  
  private func createRepoCell(_ repo: Repo) -> TableCellConfigurator {
    let cell = RepoItemCellConfigurator(
      avatarURL: repo.owner.avatar,
      displayName: repo.displayName ?? "",
      type: repo.type,
      createdOn: createCreatedOnString(from: repo.createdOn)
    )
    cell.imageSetService = imageSetService
    cell.tapAction = {
      print("Did select \(String(describing: repo.displayName))")
    }
    return cell
  }
  
  private func createCreatedOnString(from date: Date?) -> String {
    guard let date = date else { return "" }
    return createdOnFormatter.string(from: date)
  }
}
