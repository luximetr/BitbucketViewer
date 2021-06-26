//
//  WebAPIResult.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

enum WebAPIResult<T> {
  case success(T)
  case failure(WebAPIFailure)
}
