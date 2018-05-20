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

enum StoriesFinishedKeys: String {
  
  case capabilitiesPreviewFinished = "CapabilitiesPreviewFinished"
  case onboardingFinished          = "OnboardingFinished"
}

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
    navigationController.navigationBar.tintColor = .white
    navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.1451, green: 0.3451, blue: 0.5686, alpha: 1) /* #255891 */
    router.window = window
    router.navigationController = navigationController
  }
  
  // MARK: Navigation functions
  
  /// Checking defaults to know which page would first
  func assembleStartStory() -> UIViewController {
    let userDefaults = UserDefaults.standard
    var vc: UIViewController
    
    let capabilitiesPreviewFinished = userDefaults.bool(
      forKey: StoriesFinishedKeys.capabilitiesPreviewFinished.rawValue)
    if capabilitiesPreviewFinished {
      vc = assembleStoryHomePage()
    } else {
      let onboardingFinished = userDefaults.bool(
        forKey: StoriesFinishedKeys.onboardingFinished.rawValue)
      if onboardingFinished {
        vc = CapabilitiesViewController.assembleFromStoryboard()
      } else {
        vc = assembleStoryOnboarding()
      }
    }
    
    return vc
  }
  
  func assembleStoryOnboarding() -> UIViewController {
    let storyboard = SwinjectStoryboard.create(name: "Onboarding", bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
  }
  
  func assembleStoryHomePage() -> UIViewController {
    let storyboard = SwinjectStoryboard.create(name: "HomePage", bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
  }
}
