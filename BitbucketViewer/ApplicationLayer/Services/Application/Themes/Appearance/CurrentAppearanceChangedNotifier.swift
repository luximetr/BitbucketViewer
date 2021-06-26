//
//  CurrentAppearanceChangedNotifier.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

protocol CurrentAppearanceChangedObserver: AnyObject {
  func currentAppearanceChanged(_ appearance: Appearance)
}

class CurrentAppearanceChangedNotifier {
  
  // MARK: - Observers
  
  private let observers = NSHashTable<AnyObject>.weakObjects()
  
  // MARK: - Add observer
  
  func addObserver(_ observer: CurrentAppearanceChangedObserver) {
    observers.add(observer)
  }
  
  // MARK: - Notify
  
  func notifyCurrentAppearanceChanged(_ appearance: Appearance) {
    observers.allObjects.forEach { object in
      guard let observer = object as? CurrentAppearanceChangedObserver else { return }
      observer.currentAppearanceChanged(appearance)
    }
  }
}
