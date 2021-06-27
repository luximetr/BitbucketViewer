//
//  GetReposWebAPIWorker.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class GetReposWebAPIWorker: URLSessionWebAPIWorker {
  
  // MARK: - Dependencies
  
  private let paramsComposer = GetReposWebAPIParamsComposer()
  private let dataJSONParser = GetReposWebAPIDataJSONParser()
  
  // MARK: - Get repos
  
  func getRepos(nextPageDate: Date?, completion: @escaping Completion) {
    let request = createRequest(nextPageDate: nextPageDate)
    let task = session.dataTask(
      with: request,
      completionHandler: { [weak self] data, response, error in
        guard let strongSelf = self else { return }
        if let data = data,
           let json = try? JSONSerialization.jsonObject(with: data) as? JSON {
          if let webAPIData = strongSelf.dataJSONParser.parseGetReposWebAPIData(from: json) {
            completion(.success(webAPIData))
          } else {
            let failure = strongSelf.parseFailure(error: error)
            completion(.failure(failure))
          }
        } else {
          let failure = strongSelf.parseFailure(error: error)
          completion(.failure(failure))
        }
    })
    task.resume()
  }
  
  // MARK: - Create request
  
  private func createRequest(nextPageDate: Date?) -> URLRequest {
    let params = paramsComposer.createParams(nextPageDate: nextPageDate)
    return createURLEncodedRequest(
      endpoint: "repositories",
      httpMethod: "GET",
      params: params
    )
  }
  
  // MARK: - Typealiases
  
  typealias Completion = (WebAPIResult<GetReposWebAPIData>) -> Void
}
