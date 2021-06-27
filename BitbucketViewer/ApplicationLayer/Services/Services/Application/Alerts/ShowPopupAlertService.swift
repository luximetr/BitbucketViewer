//
//  ShowPopupAlertService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class ShowPopupAlertService: ShowSystemAlertService {
  
  func showPopupAlert(viewModel: AlertViewModel, in vc: UIViewController) {
    showAlert(viewModel: viewModel, style: .alert, in: vc)
  }
  
}
