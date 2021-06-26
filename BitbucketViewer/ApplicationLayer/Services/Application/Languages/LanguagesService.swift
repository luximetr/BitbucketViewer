//
//  LanguagesService.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import Foundation

class LanguagesService {
  
  // MARK: - Dependencies
  
  private let languagesFactory: LanguagesFactory
  private let currentLanguageChangedNotifier: CurrentLanguageChangedNotifier
  
  // MARK: - Data
  
  private lazy var currentLanguage = self.fetchCurrentLanguage()
  
  // MARK: - Life cycle
  
  init(currentLanguageChangedNotifier: CurrentLanguageChangedNotifier) {
    self.currentLanguageChangedNotifier = currentLanguageChangedNotifier
    languagesFactory = LanguagesFactory()
  }
  
  // MARK: - Languages handling
  
  private func fetchCurrentLanguage() -> Language {
    return fetchCachedCurrentLanguage() ?? languagesFactory.createLanguage(code: .en)
  }
  
  private func fetchCachedCurrentLanguage() -> Language? {
    return nil
  }
  
  func getLanguagesList() -> [Language] {
    return languagesFactory.createLanguagesList()
  }
  
  func getCurrentLanguage() -> Language {
    return currentLanguage
  }
  
  func changeCurrentLanguage(_ language: Language) {
    currentLanguage = language
    currentLanguageChangedNotifier.notifyCurrentLanguageChanged(language)
  }
  
  // MARK: - CurrentLanguageChanged observer
  
  func addCurrentLanguageChanged(observer: CurrentLanguageChangedObserver) {
    currentLanguageChangedNotifier.addObserver(observer)
  }
}
