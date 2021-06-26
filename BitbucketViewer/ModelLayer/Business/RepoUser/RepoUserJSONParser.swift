//
//  RepoUserJSONParser.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class RepoUserJSONParser {
  
  // MARK: - JSON - RepoUser
  
  func convertToRepoUser(from json: JSON) -> RepoUser? {
    guard let id = json["uuid"] as? RepoUserIdType else { return nil }
    let avatar = parseAvatar(from: json)
    
    return RepoUser(
      id: id,
      avatar: avatar
    )
  }
  
  private func parseAvatar(from json: JSON) -> URL? {
    guard let links = json["links"] as? JSON else { return nil }
    guard let avatarURLString = links["avatar"] as? String else { return nil }
    return URL(string: avatarURLString)
  }
}
