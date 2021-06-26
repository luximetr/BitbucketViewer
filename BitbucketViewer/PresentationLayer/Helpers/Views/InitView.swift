//
//  InitView.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit
import SnapKit

class InitView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    backgroundColor = .white
  }
  
  func autoLayout() {
  }
  
  // MARK: - AppearanceConfigurable
  
  func setAppearance(_ appearance: Appearance) {
  }
}
