//
//  Router.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

protocol Router: class {
  
  func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
  
  func navigateToLicenseInfoEntering(licenseType type: LicenseType)
}

class RouterDefault: Router {
  
  weak var window: UIWindow?
  weak var navigationController: UINavigationController?
  
  func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    navigationController?.present(viewController, animated: animated, completion: completion)
  }
  
  func navigateToLicenseInfoEntering(licenseType type: LicenseType) {
    let vc = LicenseInfoEnteringViewController.assembleFromStoryboard()
    vc.licenseType = type
    
    navigationController?.pushViewController(vc, animated: true)
  }
}
