//
//  CapabilitiesAssembly.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import SwinjectStoryboard
import Swinject

class CapabilitiesAssembly: Assembly {
  
  func assemble(container: Container) {
    registerViews(container: container)
  }
  
  private func registerViews(container: Container) {
    container.storyboardInitCompleted(CapabilitiesViewController.self) { r, vc in
      let router = r.resolve(Router.self)
      vc.router = router
    }
  }
}
