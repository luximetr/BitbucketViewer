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
  
  private let testUUID = "test uuid"
  private let testAvatarURLString = "https://images.com/cat"
  private let testAvatarURL = URL(string: "https://images.com/cat")
  private let testDisplayName = "test display name"
  private let testWebsiteURLString = "https://website.com/user"
  private let testWebsiteURL = URL(string: "https://website.com/user")
  private let testType = "test type"
  private let testNickname = "test nickname"
  
  // MARK: - JSON keys
  
  struct JSONKey {
    static var uuid = "uuid"
    static var links = "links"
    static var displayName = "display_name"
    static var html = "html"
    static var type = "type"
    static var nickname = "nickname"
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
      name: testDisplayName,
      avatar: testAvatarURL,
      website: testWebsiteURL,
      type: testType,
      nickname: testNickname
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
  
  func testNonNilRepoUserWithEmptyDisplayNameParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.displayName)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNotNil(parsedUser)
  }
  
  func testEmptyDisplayNameRepoUserParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.displayName)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNil(parsedUser?.name)
  }
  
  func testNonNilRepoUserWithEmptyTypeParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.type)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNotNil(parsedUser)
  }
  
  func testEmptyTypeRepoUserParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.type)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNil(parsedUser?.type)
  }
  
  func testNonNilRepoUserEmptyNicknameParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.nickname)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNotNil(parsedUser)
  }
  
  func testEmptyNicknameRepoUserParsing() {
    var testJSON = createTestFullRepoUserJSON()
    testJSON.removeValue(forKey: JSONKey.nickname)
    
    let parsedUser = repoUserJSONParser.parseRepoUser(from: testJSON)
    
    XCTAssertNil(parsedUser?.nickname)
  }
  
  // MARK: - Create test data
  
  private func createTestFullRepoUserJSON() -> JSON {
    return [
      JSONKey.uuid: testUUID,
      JSONKey.links: [
        "avatar": [
          "href": testAvatarURLString
        ],
        "html": [
          "href": testWebsiteURLString
        ]
      ],
      JSONKey.displayName: testDisplayName,
      JSONKey.type: testType,
      JSONKey.nickname: testNickname
    ]
  }
  
}
