//
//  TimeZone+Extension.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 27.06.2021.
//

import Foundation

extension TimeZone {
  
  static var UTC: TimeZone {
    return TimeZone(identifier: "UTC") ?? TimeZone.current
  }
}
