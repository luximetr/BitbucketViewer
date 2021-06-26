//
//  Repo.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

typealias RepoIdType = String

struct Repo {
  let id: RepoIdType
  let displayName: String
  let type: String
  let createdOn: Date
  let owner: RepoUser
}
