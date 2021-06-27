//
//  RepoUserDetailsView.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

protocol RepoUserDetailsViewDelegate: AnyObject {
  func didTapOnBack()
  func didTapOnWebsite()
}

class RepoUserDetailsView: ScreenNavigationBarView, AppearanceConfigurable {
  
  // MARK: - UI elements
  
  private let avatarImageView = UIImageView()
  private let nameLabel = UILabel()
  private let websiteLabel = UILabel()
  private let websiteButton = UIButton()
  private let typeLabel = UILabel()
  private let nicknameLabel = UILabel()
  
  // MARK: - Dependencies
  
  weak var delegate: RepoUserDetailsViewDelegate?
  private let imageSetService: ImageSetFromURLService
  
  // MARK: - Life cycle
  
  init(imageSetService: ImageSetFromURLService) {
    self.imageSetService = imageSetService
    super.init(frame: .zero)
  }
  
  // MARK: - Public
  
  func displayAvatar(_ avatarURL: URL?) {
    imageSetService.setImage(imageView: avatarImageView, imageURL: avatarURL)
  }
  
  func displayName(_ name: String) {
    nameLabel.text = name
  }
  
  func displayWebsite(_ website: String) {
    websiteLabel.text = website
  }
  
  func displayType(_ type: String) {
    typeLabel.text = type
  }
  
  func displayNickname(_ nickname: String) {
    nicknameLabel.text = nickname
  }
  
  // MARK: - Private
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    setupNavigationBarView()
    setupAvatarImageView()
    setupNameLabel()
    setupWebsiteLabel()
    setupWebsiteButton()
    setupTypeLabel()
    setupNicknameLabel()
  }
  
  // MARK: - AutoLayout
  
  override func autoLayout() {
    super.autoLayout()
    addSubviews([
      avatarImageView,
      nameLabel,
      websiteLabel,
      websiteButton,
      typeLabel,
      nicknameLabel
    ])
    autoLayoutAvatarImageView()
    autoLayoutNameLabel()
    autoLayoutWebsiteLabel()
    autoLayoutWebsiteButton()
    autoLayoutTypeLabel()
    autoLayoutNicknameLabel()
  }
  
  // MARK: - Appearance
  
  override func setAppearance(_ appearance: Appearance) {
    super.setAppearance(appearance)
    setSelf(appearance: appearance)
    setAvatarImageView(appearance: appearance)
    setNameLabel(appearance: appearance)
    setWebsiteLabel(appearance: appearance)
    setTypeLabel(appearance: appearance)
    setNicknameLabel(appearance: appearance)
  }
  
  // MARK: - Setup self
  
  private func setSelf(appearance: Appearance) {
    backgroundColor = appearance.background.primary
  }
  
  // MARK: - Setup navigationBarView
  
  private func setupNavigationBarView() {
    navigationBarView.leftButton.image = AssetsFactory.left_arrow
    navigationBarView.leftButton.addAction(self, action: #selector(didTapBackButton))
  }
  
  @objc
  private func didTapBackButton() {
    delegate?.didTapOnBack()
  }
  
  // MARK: - Setup avatarImageView
  
  private func setupAvatarImageView() {
    avatarImageView.contentMode = .scaleAspectFit
    avatarImageView.layer.masksToBounds = true
  }
  
  private func setAvatarImageView(appearance: Appearance) {
    avatarImageView.backgroundColor = appearance.background.secondary
  }
  
  private func autoLayoutAvatarImageView() {
    let side: CGFloat = 100
    avatarImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(24)
      make.top.equalTo(navigationBarView.snp.bottom).offset(24)
      make.height.width.equalTo(side)
    }
    avatarImageView.layer.cornerRadius = side / 2
  }
  
  // MARK: - Setup nameLabel
  
  private func setupNameLabel() {
    
  }
  
  private func setNameLabel(appearance: Appearance) {
    nameLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutNameLabel() {
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.top)
      make.leading.equalTo(avatarImageView.snp.trailing).offset(20)
      make.trailing.equalToSuperview().inset(24)
    }
  }
  
  // MARK: - Setup websiteLabel
  
  private func setupWebsiteLabel() {
    
  }
  
  private func setWebsiteLabel(appearance: Appearance) {
    websiteLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutWebsiteLabel() {
    websiteLabel.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.bottom).offset(10)
      make.leading.equalToSuperview().offset(24)
      make.trailing.equalToSuperview().inset(24)
    }
  }
  
  // MARK: - Setup websiteButton
  
  private func setupWebsiteButton() {
    websiteButton.addAction(self, action: #selector(didTapOnWebsiteButton))
  }
  
  private func autoLayoutWebsiteButton() {
    websiteButton.snp.makeConstraints { make in
      make.edges.equalTo(websiteLabel)
    }
  }
  
  @objc
  private func didTapOnWebsiteButton() {
    delegate?.didTapOnWebsite()
  }
  
  // MARK: - Setup typeLabel
  
  private func setupTypeLabel() {
    
  }
  
  private func setTypeLabel(appearance: Appearance) {
    typeLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutTypeLabel() {
    typeLabel.snp.makeConstraints { make in
      make.leading.trailing.equalTo(websiteLabel)
      make.top.equalTo(websiteLabel.snp.bottom).offset(10)
    }
  }
  
  // MARK: - Setup nicknameLabel
  
  private func setupNicknameLabel() {
    
  }
  
  private func setNicknameLabel(appearance: Appearance) {
    nicknameLabel.textColor = appearance.text.primary
  }
  
  private func autoLayoutNicknameLabel() {
    nicknameLabel.snp.makeConstraints { make in
      make.leading.trailing.equalTo(typeLabel)
      make.top.equalTo(typeLabel.snp.bottom).offset(10)
    }
  }
  
}
