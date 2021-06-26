//
//  ProgressHUDAppearanceService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import SVProgressHUD

class ProgressHUDAppearanceService {
  
  func applyAppearance(_ appearance: Appearance) {
    SVProgressHUD.setBackgroundColor(appearance.background.secondary)
    SVProgressHUD.setForegroundColor(appearance.text.primary)
    SVProgressHUD.setDefaultMaskType(.black)
  }
}
