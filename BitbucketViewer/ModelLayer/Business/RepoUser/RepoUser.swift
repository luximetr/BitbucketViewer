//
//  RepoUser.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

typealias RepoUserIdType = String

struct RepoUser: Equatable {
  let id: RepoUserIdType
  let name: String?
  let avatar: URL?
  let website: URL?
  let type: String?
  let nickname: String?
}
