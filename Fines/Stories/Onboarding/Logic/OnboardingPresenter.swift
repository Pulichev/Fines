//
//  OnboardingPresenter.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Foundation

protocol OnboardingPresenter: class {
  
  func navigateToLicenseInfoEntering(licenseType type: LicenseType)
}

class OnboardingPresenterDefault: OnboardingPresenter {
  
  var router: Router?
  
  func navigateToLicenseInfoEntering(licenseType type: LicenseType) {
    router?.navigateToLicenseInfoEntering(licenseType: type)
  }
  
  
}
