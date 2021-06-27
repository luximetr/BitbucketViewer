//
//  RepoUserJSONParser.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class RepoUserJSONParser {
  
  // MARK: - JSON - RepoUser
  
  func parseRepoUser(from json: JSON) -> RepoUser? {
    guard let id = json["uuid"] as? RepoUserIdType else { return nil }
    let name = json["display_name"] as? String
    let avatar = parseAvatar(from: json)
    let website = parseWebsite(from: json)
    let type = json["type"] as? String
    let nickname = json["nickname"] as? String
    
    return RepoUser(
      id: id,
      name: name,
      avatar: avatar,
      website: website,
      type: type,
      nickname: nickname
    )
  }
  
  private func parseLink(from json: JSON, key: String) -> URL? {
    guard let links = json["links"] as? JSON else { return nil }
    guard let avatarJSON = links[key] as? JSON else { return nil }
    guard let href = avatarJSON["href"] as? String else { return nil }
    return URL(string: href)
  }
  
  private func parseAvatar(from json: JSON) -> URL? {
    return parseLink(from: json, key: "avatar")
  }
  
  private func parseWebsite(from json: JSON) -> URL? {
    return parseLink(from: json, key: "html")
  }
}
