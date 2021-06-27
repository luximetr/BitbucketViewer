//
//  RepoUserJSONParserTests.swift
//  BitbucketViewerTests
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import XCTest
@testable import BitbucketViewer

class RepoUserJSONParserTests: XCTestCase {
  
  // MARK: - Dependencies
  
  private let repoUserJSONParser = RepoUserJSONParser()
  
  // MARK: - Test data
  
  private var testUUID = "test uuid"
  private var testAvatarURLString = "https://images.com/cat"
  private var testAvatarURL = URL(string: "https://images.com/cat")
  
  // MARK: - JSON keys
  
  struct JSONKey {
    static var uuid = "uuid"
    static var links = "links"
  }
  
  // MARK: - Tests
  
  func testEmptyJSONParsing() {
    let actualResult = repoUserJSONParser.parseRepoUser(from: [:])
    XCTAssertNil(actualResult)
  }
  
  func testFullRepoUserParsing() {
    let testJSON = createTestFullRepoUserJSON()
    
    let expectedResult = RepoUser(
      id: testUUID,
      avatar: testAvatarURL
    )
    
    let actualResult = repoUserJSONParser.parseRepoUser(from: testJSON)
    XCTAssertEqual(expectedResult, actualResult)
  }
  
  func testEmptyIdRepoUserParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.uuid)
    
    let expectedResult: RepoUser? = nil
    
    let actualResult = repoUserJSONParser.parseRepoUser(from: testJSON)
    XCTAssertEqual(expectedResult, actualResult)
  }
  
  func testNonNilRepoUserWithEmptyLinksParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.links)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNotNil(parsedUser)
  }
  
  func testEmptyLinksRepoUserParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.links)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNil(parsedUser?.avatar)
  }
  
  // MARK: - Create test data
  
  private func createTestFullRepoUserJSON() -> JSON {
    return [
      JSONKey.uuid: testUUID,
      JSONKey.links: [
        "avatar": [
          "href": testAvatarURLString
        ]
      ]
    ]
  }
  
}
