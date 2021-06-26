//
//  UIView+Extension.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import SnapKit

extension UIView {
  
  var safeArea: ConstraintBasicAttributesDSL {
      #if swift(>=3.2)
          if #available(iOS 11.0, *) {
              return self.safeAreaLayoutGuide.snp
          }
          return self.snp
      #else
          return self.snp
      #endif
  }
  
  func addSubviews(_ subviews: [UIView]) {
    subviews.forEach { addSubview($0) }
  }
}
