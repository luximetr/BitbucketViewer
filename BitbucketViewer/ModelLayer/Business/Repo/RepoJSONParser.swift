//
//  RepoJSONParser.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class RepoJSONParser {
  
  // MARK: - Dependencies
  
  private let repoUserJSONParser = RepoUserJSONParser()
  
  // MARK: - JSON -> Repo
  
  func parseRepo(from json: JSON) -> Repo? {
    guard let id = json["uuid"] as? RepoIdType else { return nil }
    guard let owner = parseOwner(from: json) else { return nil }
    let displayName = json["name"] as? String
    let type = json["type"] as? String
    let createdOn = Date()
    
    return Repo(
      id: id,
      displayName: displayName ?? "",
      type: type ?? "",
      createdOn: createdOn,
      owner: owner
    )
  }
  
  private func parseOwner(from json: JSON) -> RepoUser? {
    guard let ownerJSON = json["owner"] as? JSON else { return nil }
    return repoUserJSONParser.parseRepoUser(from: ownerJSON)
  }
}
