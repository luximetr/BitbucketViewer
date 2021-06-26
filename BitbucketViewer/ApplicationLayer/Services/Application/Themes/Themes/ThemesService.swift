//
//  ThemesService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class ThemesService {
  
  // MARK: - Dependencies
  
  private let themesFactory: ThemesFactory
  private let currentThemeChangedNotifier: CurrentThemeChangedNotifier
  
  // MARK: - Data
  
  private lazy var currentTheme = self.fetchCurrentTheme()
  
  // MARK: - Life cycle
  
  init(currentThemeChangedNotifier: CurrentThemeChangedNotifier) {
    themesFactory = ThemesFactory()
    self.currentThemeChangedNotifier = currentThemeChangedNotifier
  }
  
  // MARK: - Theme handling
  
  func getCurrentTheme() -> Theme {
    return currentTheme
  }
  
  private func fetchCurrentTheme() -> Theme {
    return fetchCachedCurrentTheme() ?? getDefaultTheme()
  }
  
  private func getDefaultTheme() -> Theme {
    return themesFactory.createLightTheme()
  }
  
  private func fetchCachedCurrentTheme() -> Theme? {
    return nil
  }
  
  func getThemesList() -> [Theme] {
    return themesFactory.createThemesList()
  }
  
  func changeCurrentTheme(_ theme: Theme) {
    currentTheme = theme
    currentThemeChangedNotifier.notifyCurrentThemeChanged(theme)
  }
  
  func addCurrentThemeChangedObserver(_ observer: CurrentThemeChangedObserver) {
    currentThemeChangedNotifier.addObserver(observer)
  }
}
