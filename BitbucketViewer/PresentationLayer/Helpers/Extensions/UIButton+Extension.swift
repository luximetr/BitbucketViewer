//
//  UIButton+Extension.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

extension UIButton {
  
  var title: String? {
    set { setTitle(newValue, for: .normal) }
    get { return titleLabel?.text }
  }
  
  var titleColor: UIColor? {
    set { setTitleColor(newValue, for: .normal) }
    get { return titleLabel?.textColor }
  }
  
  func addAction(_ target: Any, action: Selector) {
    addTarget(target, action: action, for: .touchUpInside)
  }
}
