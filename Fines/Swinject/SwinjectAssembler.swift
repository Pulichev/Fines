//
//  SwinjectAssembler.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class SwinjectAssembler {
  
  // MARK: Attributes
  private static let _shared = SwinjectAssembler()
  class var shared: SwinjectAssembler {
    // https://github.com/Swinject/Swinject/issues/218
    Container.loggingFunction = nil
    return _shared
  }
  
  private let assembler = Assembler([
    // services
    ServicesAssembly(),
    
    // stories
    OnboardingAssembly(),
    CapabilitiesAssembly(),
    HomePageAssembly()
    ], container: SwinjectStoryboard.defaultContainer)
  
  // MARK: Setup
  
  func setupAppRouter(window: UIWindow, navigationController: UINavigationController) {
    let router = assembler.resolver.resolve(Router.self) as! RouterDefault
    router.window = window
    router.navigationController = navigationController
  }
  
  // MARK: Navigation functions
  
  func assembleStoryOnboarding() -> UIViewController {
    let storyboard = SwinjectStoryboard.create(name: "Onboarding", bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
  }
  
  func assembleStoryHomePage() -> UIViewController {
    let storyboard = SwinjectStoryboard.create(name: "HomePage", bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
  }
}
