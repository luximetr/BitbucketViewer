//
//  ISO8601DateConvertor.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class ISO8601DateConvertor {
  
  // MARK: - Dependencies
  
  private let dateFormatter: DateFormatter
  
  // MARK: - Life cycle
  
  init() {
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
  }
  
  // MARK: - String -> Date
  
  func convertToDate(_ string: String) -> Date? {
    return dateFormatter.date(from: string)
  }
  
  // MARK: - Date -> String
  
  func convertToString(_ date: Date) -> String {
    return dateFormatter.string(from: date)
  }
}
