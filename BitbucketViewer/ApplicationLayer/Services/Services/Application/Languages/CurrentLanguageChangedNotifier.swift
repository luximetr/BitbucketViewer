//
//  CurrentLanguageChangedNotifier.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

protocol CurrentLanguageChangedObserver: AnyObject {
  func currentLanguageChanged(_ language: Language)
}

class CurrentLanguageChangedNotifier {
  
  // MARK: - Observers
  
  private let observers = NSHashTable<AnyObject>.weakObjects()
  
  // MARK: - Add observer
  
  func addObserver(_ observer: CurrentLanguageChangedObserver) {
    observers.add(observer)
  }
  
  // MARK: - Notify
  
  func notifyCurrentLanguageChanged(_ language: Language) {
    observers.allObjects.forEach { object in
      guard let observer = object as? CurrentLanguageChangedObserver else { return }
      observer.currentLanguageChanged(language)
    }
  }
  
}
