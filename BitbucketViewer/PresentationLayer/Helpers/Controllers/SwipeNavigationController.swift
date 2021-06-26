//
//  SwipeNavigationController.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class SwipeNavigationController: UINavigationController, UIGestureRecognizerDelegate {
  
  // MARK: - Life cycle
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setNavigationBarHidden(true, animated: false)
    navigationBar.barStyle = .black
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - View - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
  // MARK: - UIGestureRecognizerDelegate
  
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
      if interactivePopGestureRecognizer == gestureRecognizer {
          return viewControllers.count > 1
      }
      return true
  }
}
