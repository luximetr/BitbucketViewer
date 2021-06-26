//
//  RepoItemView.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class RepoItemView: InitView, AppearanceConfigurable {
  
  // MARK: - UI elements
  
  let avatarImageView = UIImageView()
  let displayNameLabel = UILabel()
  let typeLabel = UILabel()
  let createdOnLabel = UILabel()
  private let actionButton = UIButton()
  
  // MARK: - Action
  
  var tapAction: VoidAction?
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    setupAvatarImageView()
    setupDisplayNameLabel()
    setupTypeLabel()
    setupCreatedOnLabel()
    setupActionButton()
  }
  
  // MARK: - AutoLayout
  
  override func autoLayout() {
    super.autoLayout()
    addSubviews([
      avatarImageView,
      displayNameLabel,
      typeLabel,
      createdOnLabel,
      actionButton
    ])
    autoLayoutAvatarImageView()
    autoLayoutDisplayNameLabel()
    autoLayoutTypeLabel()
    autoLayoutCreatedOnLabel()
    autoLayoutActionButton()
  }
  
  // MARK: - Appearance
  
  override func setAppearance(_ appearance: Appearance) {
    super.setAppearance(appearance)
    setSelf(appearance: appearance)
    setDisplayNameLabel(appearance: appearance)
    setTypeLabel(appearance: appearance)
    setCreatedOnLabel(appearance: appearance)
  }
  
  // MARK: - Setup self
  
  private func setSelf(appearance: Appearance) {
    backgroundColor = appearance.background.primary
  }
  
  // MARK: - Setup avatarImageView
  
  private func setupAvatarImageView() {
    avatarImageView.contentMode = .scaleAspectFit
    avatarImageView.layer.masksToBounds = true
  }
  
  private func autoLayoutAvatarImageView() {
    let side: CGFloat = 50
    avatarImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(24)
      make.top.equalToSuperview().offset(10)
      make.width.height.equalTo(side)
      make.bottom.equalToSuperview().inset(10)
    }
    avatarImageView.layer.cornerRadius = side / 2
  }
  
  // MARK: - Setup displayNameLabel
  
  private func setupDisplayNameLabel() {
    
  }
  
  private func setDisplayNameLabel(appearance: Appearance) {
    displayNameLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutDisplayNameLabel() {
    displayNameLabel.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.top)
      make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
      make.trailing.equalToSuperview().inset(24)
    }
  }
  
  // MARK: - Setup typeLabel
  
  private func setupTypeLabel() {
    
  }
  
  private func setTypeLabel(appearance: Appearance) {
    typeLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutTypeLabel() {
    typeLabel.snp.makeConstraints { make in
      make.leading.trailing.equalTo(displayNameLabel)
      make.top.equalTo(displayNameLabel.snp.bottom).offset(2)
    }
  }
  
  // MARK: - Setup createdOnLabel
  
  private func setupCreatedOnLabel() {
    
  }
  
  private func setCreatedOnLabel(appearance: Appearance) {
    createdOnLabel.textColor = appearance.text.secondary
  }
  
  private func autoLayoutCreatedOnLabel() {
    createdOnLabel.snp.makeConstraints { make in
      make.leading.trailing.equalTo(typeLabel)
      make.top.equalTo(typeLabel.snp.bottom).offset(2)
    }
  }
  
  // MARK: - Setup actionButton
  
  private func setupActionButton() {
    actionButton.addAction(self, action: #selector(didTapOnActionButton))
  }
  
  private func autoLayoutActionButton() {
    actionButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  @objc
  private func didTapOnActionButton() {
    tapAction?()
  }
  
}
