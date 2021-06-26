//
//  NotifiersFactory.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class NotifiersFactory {
  
  // MARK: - Dependencies
  
  private let referenceStorage: ReferenceStorage
  
  // MARK: - Life cycle
  
  init(referenceStorage: ReferenceStorage) {
    self.referenceStorage = referenceStorage
  }
  
}
