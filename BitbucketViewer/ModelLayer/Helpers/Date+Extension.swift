//
//  Date+Extension.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

extension Date {
  
  static func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, timeZone: TimeZone = .UTC) -> Date? {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    dateComponents.hour = hour
    dateComponents.minute = minute
    dateComponents.second = second
    dateComponents.nanosecond = nanosecond
    dateComponents.timeZone = timeZone
    return Calendar.current.date(from: dateComponents)
  }
  
  static func isEqual(_ lhs: Date?, _ rhs: Date?) -> Bool {
    if lhs == nil && rhs == nil { return true }
    guard let lhs = lhs, let rhs = rhs else { return false }
    return Calendar.current.compare(lhs, to: rhs, toGranularity: .nanosecond) == .orderedSame
  }
}
