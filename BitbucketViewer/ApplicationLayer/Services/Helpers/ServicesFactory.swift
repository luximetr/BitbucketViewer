//
//  ServicesFactory.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ServicesFactory {
  
  // MARK: - Dependencies
  
  private let application: UIApplication
  private let webAPIWorkersFactory: WebAPIWorkersFactory
  private let notifiersFactory: NotifiersFactory
  private let referenceStorage: ReferenceStorage
  
  // MARK: - Life cycle
  
  init(application: UIApplication,
       session: URLSession,
       referenceStorage: ReferenceStorage
  ) {
    self.application = application
    self.webAPIWorkersFactory = WebAPIWorkersFactory(
      session: session
    )
    self.notifiersFactory = NotifiersFactory(
      referenceStorage: referenceStorage
    )
    self.referenceStorage = referenceStorage
  }
  
  // MARK: - Start
  
  func createFirstScreenService(window: UIWindow) -> FirstScreenService {
    return FirstScreenService(
      window: window,
      servicesFactory: self
    )
  }
  
  // MARK: - Theme
  
  func createThemesService() -> ThemesService {
    let key = "themesService"
    if let service = referenceStorage.getObject(key) as? ThemesService {
      return service
    } else {
      let service = ThemesService(
        currentThemeChangedNotifier: notifiersFactory.createCurrentThemeChangedNotifier()
      )
      referenceStorage.storeObject(key, object: service)
      return service
    }
  }
  
  // MARK: - Appearance
  
  func createAppearanceService() -> AppearanceService {
    let key = "appearanceService"
    if let service = referenceStorage.getObject(key) as? AppearanceService {
      return service
    } else {
      let service = AppearanceService(
        themesService: createThemesService(),
        currentAppearanceChangedNotifier: notifiersFactory.createCurrentAppearanceChangedNotifier(),
        progressHUDAppearanceService: createProgressHUDAppearanceService()
      )
      referenceStorage.storeObject(key, object: service)
      return service
    }
  }
  
  private func createProgressHUDAppearanceService() -> ProgressHUDAppearanceService {
    return ProgressHUDAppearanceService()
  }
}
