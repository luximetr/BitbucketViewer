//
//  RepoJSONParserTests.swift
//  BitbucketViewerTests
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import XCTest
@testable import BitbucketViewer

class RepoJSONParserTests: XCTestCase {
  
  // MARK: - Dependencies
  
  private let repoJSONParser = RepoJSONParser()
  
  // MARK: - Test data
  
  private var repoTestId = "testId"
  private var repoTestDisplayName = "test display name"
  private var repoTestType = "test type"
  private var repoTestCreatedOn = Date.createDate(year: 2011, month: 6, day: 6, hour: 3, minute: 40, second: 09, nanosecond: 505792)
  private var repoTestCreatedOnString = "2011-06-06T03:40:09.505792+00:00"
  private var repoUserTestId = "test owner id"
  private var repoUserTestAvatarURLString = "https://images.com/cat"
  private var repoUserTestAvatarURL = URL(string: "https://images.com/cat")
  
  // MARK: - Tests
  
  func testEmptyJSONParsing() {
    let actualResult = repoJSONParser.parseRepo(from: [:])
    XCTAssertNil(actualResult)
  }
  
  func testFullRepoParsing() {
    let testJSON: JSON = [
      "uuid": repoTestId,
      "name": repoTestDisplayName,
      "type": repoTestType,
      "created_on": repoTestCreatedOnString,
      "owner": [
        "uuid": repoUserTestId,
        "links": [
          "avatar": [
            "href": repoUserTestAvatarURLString
          ]
        ]
      ]
    ]
    
    let expectedResult = Repo(
      id: repoTestId,
      displayName: repoTestDisplayName,
      type: repoTestType,
      createdOn: repoTestCreatedOn,
      owner: RepoUser(
        id: repoUserTestId,
        avatar: repoUserTestAvatarURL
      )
    )
    
    let actualResult = repoJSONParser.parseRepo(from: testJSON)
    XCTAssertEqual(expectedResult, actualResult)
  }
  
}
