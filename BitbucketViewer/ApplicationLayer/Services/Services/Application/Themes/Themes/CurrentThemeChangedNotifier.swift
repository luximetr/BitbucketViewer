//
//  CurrentThemeChangedNotifier.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

protocol CurrentThemeChangedObserver: AnyObject {
  func currentThemeChanged(_ theme: Theme)
}

class CurrentThemeChangedNotifier {
  
  // MARK: - Observers
  
  private let observers = NSHashTable<AnyObject>.weakObjects()
  
  // MARK: - Add observer
  
  func addObserver(_ observer: CurrentThemeChangedObserver) {
    observers.add(observer)
  }
  
  // MARK: - Notify
  
  func notifyCurrentThemeChanged(_ theme: Theme) {
    observers.allObjects.forEach { object in
      guard let observer = object as? CurrentThemeChangedObserver else { return }
      observer.currentThemeChanged(theme)
    }
  }
}
