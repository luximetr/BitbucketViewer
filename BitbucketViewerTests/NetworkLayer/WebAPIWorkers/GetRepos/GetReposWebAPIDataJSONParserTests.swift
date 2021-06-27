//
//  GetReposWebAPIDataJSONParserTests.swift
//  BitbucketViewerTests
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import XCTest
@testable import BitbucketViewer

class GetReposWebAPIDataJSONParserTests: XCTestCase {
  
  // MARK: - Dependencies
  
  private let parser = GetReposWebAPIDataJSONParser()
  
  // MARK: - Test data
  
  private let testNext = "https://api.bitbucket.org/2.0/repositories?after=2011-09-03T12%3A33%3A16.028393%2B00%3A00"
  private let testNextDate = Date.createDate(year: 2011, month: 9, day: 3, hour: 12, minute: 33, second: 16, nanosecond: 028393)
  
  // MARK: - JSON keys
  
  struct JSONKeys {
    static var values = "values"
    static var next = "next"
  }
  
  // MARK: - Tests
  
  func testEmptyJSONParsing() {
    let actualResult = parser.parseGetReposWebAPIData(from: [:])
    XCTAssertNil(actualResult)
  }
  
  func testNonNilDataWithEmptyValuesParsing() {
    let testJSON = [JSONKeys.values: []]
    
    let actualResult = parser.parseGetReposWebAPIData(from: testJSON)
    
    XCTAssertNotNil(actualResult)
  }
  
  func testEmptyValuesParsing() {
    let testJSON = [JSONKeys.values: []]
    let expectedResult = GetReposWebAPIData(repos: [], nextPageDate: nil)
    
    let actualResult = parser.parseGetReposWebAPIData(from: testJSON)
    
    XCTAssertEqual(expectedResult, actualResult)
  }
  
  func testNextPageDateParsing() {
    let testJSON: JSON = [
      JSONKeys.values: [],
      JSONKeys.next: testNext
    ]
    let expectedResult = GetReposWebAPIData(repos: [], nextPageDate: testNextDate)
    
    let actualResult = parser.parseGetReposWebAPIData(from: testJSON)
    
    XCTAssertEqual(expectedResult, actualResult)
  }
  
}
