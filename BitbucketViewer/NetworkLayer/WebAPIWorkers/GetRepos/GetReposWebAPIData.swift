//
//  GetReposWebAPIData.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

struct GetReposWebAPIData {
  let repos: [Repo]
  let nextPageDate: Date?
}
