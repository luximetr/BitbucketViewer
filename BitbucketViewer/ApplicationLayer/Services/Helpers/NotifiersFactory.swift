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
  
  // MARK: - Theme
  
  func createCurrentThemeChangedNotifier() -> CurrentThemeChangedNotifier {
    let key = "currentThemeChangedNotifier"
    if let notifier = referenceStorage.getObject(key) as? CurrentThemeChangedNotifier {
      return notifier
    } else {
      let notifier = CurrentThemeChangedNotifier()
      referenceStorage.storeObject(key, object: notifier)
      return notifier
    }
  }
  
  // MARK: - Appearance
  
  func createCurrentAppearanceChangedNotifier() -> CurrentAppearanceChangedNotifier {
    let key = "currentAppearanceChangedNotifier"
    if let notifier = referenceStorage.getObject(key) as? CurrentAppearanceChangedNotifier {
      return notifier
    } else {
      let notifier = CurrentAppearanceChangedNotifier()
      referenceStorage.storeObject(key, object: notifier)
      return notifier
    }
  }
  
  // MARK: - Language
  
  func createCurrentLanguageChangedNotifier() -> CurrentLanguageChangedNotifier {
    let key = "currentLanguageChangedNotifier"
    if let notifier = referenceStorage.getObject(key) as? CurrentLanguageChangedNotifier {
      return notifier
    } else {
      let notifier = CurrentLanguageChangedNotifier()
      referenceStorage.storeObject(key, object: notifier)
      return notifier
    }
  }
}
