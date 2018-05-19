//
//  OnboardingAssembly.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension LicenseInfoEnteringViewController {
  
  static public func assembleFromStoryboard() -> LicenseInfoEnteringViewController {
    let storyboardId = "Onboarding"
    let viewControllerId = "LicenseInfoEnteringViewController"
    let storyboard = SwinjectStoryboard.create(name: storyboardId, bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: viewControllerId) as? LicenseInfoEnteringViewController else {
      fatalError("Could not load view controller from storyboard file: \(storyboardId)")
    }
    return vc
  }
}

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
