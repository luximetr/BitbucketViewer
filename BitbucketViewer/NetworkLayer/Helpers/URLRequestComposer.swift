//
//  URLRequestComposer.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class URLRequestComposer {
  
  // MARK: - Dependencies
  
  private let baseURL: String
  
  // MARK: - Life cycle
  
  init(baseURL: String) {
    self.baseURL = baseURL
  }
  
  // MARK: - Create request
  
  func createRequest(
      endpoint: String,
      customHeaders: [String: String],
      contentType: String) -> URLRequest {
    let url = URL(string: baseURL + "/" + endpoint)!
    var request = URLRequest(url: url)
    request.addValue(contentType, forHTTPHeaderField: "Content-Type")
    for (_, (headerKey, headerValue)) in customHeaders.enumerated() {
      request.addValue(headerValue, forHTTPHeaderField: headerKey)
    }
    return request
  }
  
  func createURLEncodedRequest(
    endpoint: String,
    customHeaders: [String: String],
    params: [String: String]
  ) -> URLRequest {
    var components = URLComponents(string: baseURL + "/" + endpoint)!
    components.queryItems = params.map { (key, value) in
      URLQueryItem(name: key, value: value)
    }
    return URLRequest(url: components.url!)
  }
}
