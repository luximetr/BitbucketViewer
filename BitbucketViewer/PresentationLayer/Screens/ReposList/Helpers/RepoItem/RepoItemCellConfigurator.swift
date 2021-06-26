//
//  RepoItemCellConfigurator.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class RepoItemCellConfigurator: ContainerTableCellConfigurator<RepoItemView> {
  
  // MARK: - Cell data
  
  override var cellId: String { return "repoItemCell" }
  
  // MARK: - Data
  
  private let avatarURL: URL?
  let displayName: String
  let type: String?
  let createdOn: String?
  var tapAction: VoidAction?
  
  // MARK: - Life cycle
  
  init(avatarURL: URL?,
       displayName: String,
       type: String?,
       createdOn: String?
  ) {
    self.avatarURL = avatarURL
    self.displayName = displayName
    self.type = type
    self.createdOn = createdOn
  }
  
  // MARK: - Setup view - UI
  
  override func setupCellViewUI(_ view: ContainerTableCellConfigurator<RepoItemView>.ViewType) {
    super.setupCellViewUI(view)
    
  }
}
