//
//  ShowErrorAlertService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class ShowErrorAlertService: ShowPopupAlertService {
  
  // MARK: - Dependencies
  
  private let stringsLocalizeService: StringsLocalizeService
  
  // MARK: - Life cycle
  
  init(stringsLocalizeService: StringsLocalizeService) {
    self.stringsLocalizeService = stringsLocalizeService
  }
  
  // MARK: - Show alert
  
  func showRepeatErrorAlert(message: String, in vc: UIViewController, onRepeat: VoidAction?) {
    let cancelAction = AlertAction(
      title: getLocalizedString(key: "error_alert.cancel"),
      action: {},
      style: .normal)
    let repeatAction = AlertAction(
      title: getLocalizedString(key: "error_alert.repeat"),
      action: { onRepeat?() },
      style: .normal)
    let actions = [cancelAction, repeatAction]
    let viewModel = AlertViewModel(
      title: getLocalizedString(key: "error_alert.title"),
      message: message,
      actions: actions)
    showPopupAlert(viewModel: viewModel, in: vc)
  }
  
  // MARK: - Get localized string
  
  func getLocalizedString(key: String) -> String {
    return stringsLocalizeService.getLocalizedString(key: key)
  }
}

