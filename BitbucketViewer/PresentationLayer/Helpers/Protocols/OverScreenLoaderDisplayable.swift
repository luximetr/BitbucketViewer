//
//  OverScreenLoaderDisplayable.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import SVProgressHUD

protocol OverScreenLoaderDisplayable {
  func showOverScreenLoader()
  func hideOverScreenLoader()
}

extension OverScreenLoaderDisplayable where Self: UIViewController {
  
  func showOverScreenLoader() {
    view.endEditing(true)
    SVProgressHUD.show()
  }
  
  func hideOverScreenLoader() {
    SVProgressHUD.dismiss()
  }
  
}
