//
//  AppDelegate.swift
//  Fines
//
//  Created by Владислав Пуличев on 17.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    configureInitialUI()
    
    return true
  }
  
  func configureInitialUI() {
    let windowFrame = UIScreen.main.bounds
    window = UIWindow(frame: windowFrame)
    let onboardingVC = SwinjectAssembler.shared.assembleStoryOnboarding()
    let navigationController = UINavigationController(rootViewController: onboardingVC)
    navigationController.isNavigationBarHidden = true
    window!.rootViewController = navigationController
    window!.makeKeyAndVisible()
    
    SwinjectAssembler.shared.setupAppRouter(window: window!, navigationController: navigationController)
  }

  func applicationWillResignActive(_ application: UIApplication) {
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
  }

  func applicationWillTerminate(_ application: UIApplication) {
  }
}

