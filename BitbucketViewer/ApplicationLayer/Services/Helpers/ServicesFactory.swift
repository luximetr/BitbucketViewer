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
}
