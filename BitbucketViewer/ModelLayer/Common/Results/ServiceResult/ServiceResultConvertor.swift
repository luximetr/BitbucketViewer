//
//  ServiceResultConvertor.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class ServiceResultConvertor {
  
  // MARK: - Dependencies
  
  private let errorConvertor = ServiceErrorConvertor()
  
  // MARK: - WebAPIResult -> ServiceResult
  
  func toServiceResult<T>(_ webAPIResult: WebAPIResult<T>) -> ServiceResult<T> {
    switch webAPIResult {
    case .success(let value):
      return .success(value)
    case .failure(let failure):
      let serviceError = errorConvertor.toError(failure: failure)
      return .failure(serviceError)
    }
  }
  
}
