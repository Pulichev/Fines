//
//  OnboardingAssembly.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class OnboardingAssembly: Assembly {
  
  func assemble(container: Container) {
    registerPresenters(container: container)
    registerViews(container: container)
  }
  
  private func registerPresenters(container: Container) {
    container.register(LicenseInfoEnteringPresenter.self) { r in
      let presenter = LicenseInfoEnteringPresenterDefault()
      let router = r.resolve(Router.self)
      presenter.router = router
      
      return presenter
     }
  }
  
  private func registerViews(container: Container) {
    container.storyboardInitCompleted(LicenseInfoEnteringViewController.self) { r, vc in
      let presenter = r.resolve(LicenseInfoEnteringPresenter.self)
      vc.licenseInfoEnteringPresenter = presenter
      presenter?.licenseInfoEnteringView = vc
    }
  }
}
