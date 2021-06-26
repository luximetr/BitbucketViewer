//
//  SetImageFromURLService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit
import SDWebImage

class ImageSetFromURLService {
  
  func setImage(imageView: UIImageView, imageURL: URL?, placeholder: UIImage? = nil) {
    if let imageURL = imageURL {
      if imageURL.isFileURL {
        guard let data = try? Data(contentsOf: imageURL) else { return }
        if let gifImage = UIImage.sd_image(withGIFData: data) {
          imageView.image = gifImage
        } else if let image = UIImage(data: data){
          imageView.image = image
        }
      } else {
        imageView.sd_imageTransition = .fade
        imageView.sd_setImage(
          with: imageURL,
          placeholderImage: placeholder,
          options: [.refreshCached]
        )
      }
    } else {
      imageView.sd_setImage(
        with: imageURL,
        placeholderImage: placeholder,
        options: [.refreshCached]
      )
    }
  }
}
