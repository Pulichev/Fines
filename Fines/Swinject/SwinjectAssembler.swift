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

class SwinjectAssembler: NSObject {
  // MARK: Attributes
  private static let _shared = SwinjectAssembler()
  public class var shared: SwinjectAssembler {
    // https://github.com/Swinject/Swinject/issues/218
    Container.loggingFunction = nil
    return _shared
  }
  
  private let assembler = Assembler([
    // services
    ServicesAssembly(),
    
    // stories
    OnboardingAssembly(),
    HomePageAssembly()
    ], container: SwinjectStoryboard.defaultContainer)
  
  // MARK: External Interface
  public func setupAppRouter(window: UIWindow, navigationController: UINavigationController) {
    let router = assembler.resolver.resolve(Router.self) as! RouterDefault
    router.window = window
    router.navigationController = navigationController
  }
  
  public func assembleRouterAndNavigateToOnboarding() {
    if let router = assembler.resolver.resolve(Router.self) {
    }
  }
  
  public func assembleStoryOnboarding() -> UIViewController {
    let storyboard = SwinjectStoryboard.create(name: "Onboarding", bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
  }
}
