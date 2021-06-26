//
//  GetReposService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class GetReposService {
  
  // MARK: - Dependencies
  
  private let getReposWebAPIWorker: GetReposWebAPIWorker
  
  // MARK: - Life
  
  init(getReposWebAPIWorker: GetReposWebAPIWorker) {
    self.getReposWebAPIWorker = getReposWebAPIWorker
  }
  
  // MARK: - Get repos
  
  func getRepos(completion: @escaping Completion) {
    getReposWebAPIWorker.getRepos(completion: { webAPIResult in
      let result = ServiceResultConvertor().toServiceResult(webAPIResult)
      completion(result)
    })
  }
  
  // MARK: - Typealiases
  
  typealias Completion = (ServiceResult<[Repo]>) -> Void
}
