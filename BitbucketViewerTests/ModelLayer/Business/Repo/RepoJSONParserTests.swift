//
//  RepoJSONParserTests.swift
//  BitbucketViewerTests
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import XCTest
@testable import BitbucketViewer

class RepoJSONParserTests: XCTestCase {
  
  private let repoJSONParser = RepoJSONParser()
  
  func testEmptyJSONParsing() {
    let actualResult = repoJSONParser.parseRepo(from: [:])
    XCTAssertNil(actualResult)
  }
  
  func testFullRepoParsing() {
    
  }
  
}
