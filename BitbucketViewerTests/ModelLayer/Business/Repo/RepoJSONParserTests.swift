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
  
  // MARK: - JSON keys
  
  struct JSONKey {
    static var repoUUID = "uuid"
    static var repoName = "name"
    static var repoType = "type"
    static var repoCreatedOn = "created_on"
    static var repoOwner = "owner"
  }
  
  // MARK: - Tests
  
  func testEmptyJSONParsing() {
    let actualResult = repoJSONParser.parseRepo(from: [:])
    XCTAssertNil(actualResult)
  }
  
  func testFullRepoParsing() {
    let testJSON = createTestFullRepoJSON()
    
    let expectedResult = Repo(
      id: repoTestId,
      displayName: repoTestDisplayName,
      type: repoTestType,
      createdOn: repoTestCreatedOn,
      owner: RepoUser(
        id: repoUserTestId,
        name: nil,
        avatar: repoUserTestAvatarURL,
        website: nil,
        type: nil,
        nickname: nil
      )
    )
    
    let actualResult = repoJSONParser.parseRepo(from: testJSON)
    XCTAssertEqual(expectedResult, actualResult)
  }
  
  func testEmptyIdRepoParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoUUID)
    
    let expectedResult: Repo? = nil
    
    let actualResult = repoJSONParser.parseRepo(from: testJSON)
    XCTAssertEqual(expectedResult, actualResult)
  }
  
  func testNonNilRepoWithEmptyNameParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoName)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNotNil(parsedRepo)
  }
  
  func testEmptyNameRepoParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoName)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNil(parsedRepo?.displayName)
  }
  
  func testNonNilRepoWithEmptyTypeParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoType)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNotNil(parsedRepo)
  }
  
  func testRepoEmptyTypeParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoType)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNil(parsedRepo?.type)
  }
  
  func testNonNulRepoWithEmptyCreatedOnParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoCreatedOn)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNotNil(parsedRepo)
  }
  
  func testRepoEmptyCreatedOnParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoCreatedOn)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNil(parsedRepo?.createdOn)
  }
  
  func testRepoEmptyOwnerParsing() {
    var testJSON = createTestFullRepoJSON()
    testJSON.removeValue(forKey: JSONKey.repoOwner)
    
    let parsedRepo = repoJSONParser.parseRepo(from: testJSON)
    
    XCTAssertNil(parsedRepo?.createdOn)
  }
  
  // MARK: - Create test data
  
  private func createTestFullRepoJSON() -> JSON {
    return [
      JSONKey.repoUUID: repoTestId,
      JSONKey.repoName: repoTestDisplayName,
      JSONKey.repoType: repoTestType,
      JSONKey.repoCreatedOn: repoTestCreatedOnString,
      JSONKey.repoOwner: [
        "uuid": repoUserTestId,
        "links": [
          "avatar": [
            "href": repoUserTestAvatarURLString
          ]
        ]
      ]
    ]
  }
  
}
