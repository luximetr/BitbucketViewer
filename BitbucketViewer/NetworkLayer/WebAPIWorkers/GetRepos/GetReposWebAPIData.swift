//
//  GetReposWebAPIData.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

struct GetReposWebAPIData: Equatable {
  let repos: [Repo]
  let nextPageDate: Date?
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    return
      lhs.repos == rhs.repos &&
      Date.isEqual(lhs.nextPageDate, rhs.nextPageDate)
  }
}
