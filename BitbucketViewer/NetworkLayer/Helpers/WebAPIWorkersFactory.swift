//
//  WebAPIWorkersFactory.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class WebAPIWorkersFactory {
  
  // MARK: - Dependencies
  
  private let session: URLSession
  private let baseURL: String
  private let requestComposer: URLRequestComposer
  
  // MARK: - Life cycle
  
  init(session: URLSession) {
    self.session = session
    baseURL = "https://api.bitbucket.org/2.0"
    requestComposer = URLRequestComposer(baseURL: baseURL)
  }
  
  // MARK: - Repos
  
  func createGetReposWebAPIWorker() -> GetReposWebAPIWorker {
    return GetReposWebAPIWorker(
      session: session,
      requestComposer: requestComposer
    )
  }
  
}
