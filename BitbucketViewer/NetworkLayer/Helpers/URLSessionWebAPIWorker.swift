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
      params: [String: Any] = [:]) -> URLRequest {
    return createURLRequest(
      endpoint: endpoint,
      httpMethod: httpMethod,
      customHeaders: customHeaders,
      contentType: "application/json",
      body: try? JSONSerialization.data(withJSONObject: params))
  }
  
  func createURLRequest(
      endpoint: String,
      httpMethod: String,
      customHeaders: [String: String] = [:],
      contentType: String,
      body: Data?) -> URLRequest {
    var request = requestComposer.createRequest(
      endpoint: endpoint,
      customHeaders: customHeaders,
      contentType: contentType)
    request.httpMethod = httpMethod
    request.httpBody = body
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
