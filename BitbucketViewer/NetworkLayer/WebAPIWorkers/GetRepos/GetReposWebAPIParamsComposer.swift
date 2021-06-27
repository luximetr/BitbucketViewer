//
//  GetReposWebAPIParamsComposer.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

class GetReposWebAPIParamsComposer {
  
  private let dateConvertor = ISO8601DateConvertor()
  
  func createParams(nextPageDate: Date?) -> [String: String] {
    var params: [String: String] = [:]
    if let nextPageDate = nextPageDate {
      params["after"] = dateConvertor.convertToString(nextPageDate)
    }
    return params
  }
  
}
