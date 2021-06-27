//
//  GetReposWebAPIDataJSONParser.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

class GetReposWebAPIDataJSONParser {
  
  // MARK: - Dependencies
  
  private let repoJSONParser = RepoJSONParser()
  private let dateParser = ISO8601DateConvertor()
  
  // MARK: - JSON -> GetReposWebAPIData
  
  func parseGetReposWebAPIData(from json: JSON) -> GetReposWebAPIData? {
    guard let repos = parseRepos(from: json) else { return nil }
    let nextPageDate = parseNextPageDate(from: json)
    
    return GetReposWebAPIData(
      repos: repos,
      nextPageDate: nextPageDate
    )
  }
  
  private func parseRepos(from json: JSON) -> [Repo]? {
    guard let valueJSONs = json["values"] as? [JSON] else { return nil }
    return valueJSONs.compactMap { repoJSONParser.parseRepo(from: $0 )}
  }
  
  private func parseNextPageDate(from json: JSON) -> Date? {
    guard let nextPageURLString = json["next"] as? String else { return nil }
    guard let nextPageURL = URL(string: nextPageURLString) else { return nil }
    let components = URLComponents(url: nextPageURL, resolvingAgainstBaseURL: true)
    let dateQueryItem = components?.queryItems?.first(where: { $0.name == "after" })
    return dateParser.convertToDate(dateQueryItem?.value ?? "")
  }
}
