//
//  Repo.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

typealias RepoIdType = String

struct Repo: Equatable {
  let id: RepoIdType
  let displayName: String?
  let type: String?
  let createdOn: Date?
  let owner: RepoUser
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    return
      lhs.id == rhs.id &&
      lhs.displayName == rhs.displayName &&
      lhs.type == rhs.type &&
      Date.isEqual(lhs.createdOn, rhs: rhs.createdOn) &&
      lhs.owner == rhs.owner
  }
}
