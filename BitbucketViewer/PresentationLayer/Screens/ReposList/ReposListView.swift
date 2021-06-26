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
  
  // MARK: - Controllers
  
  private let tableViewController = TableViewController()
  
  // MARK: - List - Display
  
  func displayList() {
    
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
}
