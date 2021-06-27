//
//  RepoUserWebsiteView.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit
import WebKit

protocol RepoUserWebsiteViewDelegate: AnyObject {
  func didTapOnBack()
}

class RepoUserWebsiteView: ScreenNavigationBarView, AppearanceConfigurable {
  
  // MARK: - UI elements
  
  private let webView = WKWebView()
  
  // MARK: - Dependencies
  
  weak var delegate: RepoUserWebsiteViewDelegate?
  
  // MARK: - Public
  
  func displayWebsite(_ website: URL) {
    let request = URLRequest(url: website)
    webView.load(request)
  }
  
  // MARK: - Private
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    setupNavigationBarView()
    setupWebView()
  }
  
  // MARK: - Appearance
  
  override func setAppearance(_ appearance: Appearance) {
    super.setAppearance(appearance)
    setWebView(appearance: appearance)
  }
  
  // MARK: - AutoLayout
  
  override func autoLayout() {
    super.autoLayout()
    addSubview(webView)
    autoLayoutWebView()
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
  
  // MARK: - Setup webView
  
  private func setupWebView() {
    
  }
  
  private func setWebView(appearance: Appearance) {
    webView.backgroundColor = appearance.background.primary
  }
  
  private func autoLayoutWebView() {
    webView.snp.makeConstraints { make in
      make.top.equalTo(navigationBarView.snp.bottom)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}
