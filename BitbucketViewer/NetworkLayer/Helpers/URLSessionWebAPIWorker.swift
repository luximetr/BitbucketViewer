//
//  URLSessionWebAPIWorker.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class URLSessionWebAPIWorker {
  
  // MARK: - Dependencies
  
  let session: URLSession
  private let requestComposer: URLRequestComposer
  private let failureConvertor = WebAPIFailureConvertor()
  
  // MARK: - Life cycle
  
  init(session: URLSession, requestComposer: URLRequestComposer) {
    self.session = session
    self.requestComposer = requestComposer
  }
  
  // MARK: - Create request
  
  func createURLRequest(
      endpoint: String,
      httpMethod: String,
      customHeaders: [String: String] = [:],
      params: [String: Any] = [:]
  ) -> URLRequest {
    var request = requestComposer.createRequest(
      endpoint: endpoint,
      customHeaders: customHeaders,
      contentType: "application/json"
    )
    request.httpMethod = httpMethod
    request.httpBody = try? JSONSerialization.data(withJSONObject: params)
    return request
  }
  
  func createURLEncodedRequest(
    endpoint: String,
    httpMethod: String,
    customHeader: [String: String] = [:],
    params: [String: String] = [:]
  ) -> URLRequest {
    var request = requestComposer.createURLEncodedRequest(
      endpoint: endpoint,
      customHeaders: customHeader,
      params: params)
    request.httpMethod = httpMethod
    return request
  }
  
  // MARK: - Parse webAPIError
  
  func parseFailure(json: JSON) -> WebAPIFailure {
    return failureConvertor.toFailure(json: json)
  }
  
  func parseFailure(error: Error?) -> WebAPIFailure {
    return failureConvertor.toFailure(error: error)
  }
}
