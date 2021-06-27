//
//  AssetsFactory.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import UIKit

class AssetsFactory {
  
  static var left_arrow: UIImage {
    return createImage(named: "left_arrow")
  }
  
  private static func createImage(named: String) -> UIImage {
    return UIImage(named: named) ?? UIImage()
  }
  
}
