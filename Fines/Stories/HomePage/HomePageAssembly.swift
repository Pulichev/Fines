//
//  HomePageAssembly.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension HomePageViewController {
  
  static public func assembleFromStoryboard() -> HomePageViewController {
    let storyboardId = "HomePage"
    let viewControllerId = "HomePageViewController"
    let storyboard = SwinjectStoryboard.create(name: storyboardId, bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: viewControllerId) as? HomePageViewController else {
      fatalError("Could not load view controller from storyboard file: \(storyboardId)")
    }
    return vc
  }
}

class HomePageAssembly: Assembly {
  
  func assemble(container: Container) {
    registerPresenters(container: container)
    registerViews(container: container)
  }
  
  private func registerPresenters(container: Container) {
    container.register(HomePagePresenter.self) { r in
      let presenter = HomePagePresenterDefault()
      let router = r.resolve(Router.self)
      presenter.router = router
      
      return presenter
    }
  }
  
  private func registerViews(container: Container) {
    container.storyboardInitCompleted(HomePageViewController.self) { r, vc in
      let presenter = r.resolve(HomePagePresenter.self)
      vc.homePagePresenter = presenter
      presenter?.homePageView = vc
    }
  }
}
