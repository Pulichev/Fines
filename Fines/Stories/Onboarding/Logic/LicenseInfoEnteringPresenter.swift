//
//  OnboardingPresenter.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Foundation

protocol LicenseInfoEnteringView: class {
  
  func validationComplete(withResult isValid: Bool)
}

protocol LicenseInfoEnteringPresenter: class {
  
  var licenseInfoEnteringView: LicenseInfoEnteringView? { set get }
  
  func viewDidLoad(withType type: LicenseType)
  func validate(enteredInfo text: String)
  
  func navigateToNextLicenseInfoEnteringType()
}

class LicenseInfoEnteringPresenterDefault: LicenseInfoEnteringPresenter {
  
  var router: Router?
  
  weak var licenseInfoEnteringView: LicenseInfoEnteringView?
  
  var licenseType: LicenseType = .plate
  
  func viewDidLoad(withType type: LicenseType) {
    licenseType = type
  }
  
  func validate(enteredInfo text: String) {
    if licenseType == .plate {
      let isValid = LicensePlateValidator.validate(licensePlate: text)
      licenseInfoEnteringView?.validationComplete(withResult: isValid)
    } else {
      let isValid = DriverLicenseValidator.validate(licenseNumber: text)
      licenseInfoEnteringView?.validationComplete(withResult: isValid)
    }
  }
  
  func navigateToNextLicenseInfoEnteringType() {
    // check current type for getting next
    let nextLicenseType: LicenseType = licenseType == .plate ? .vehicleRegistration : .driverRegistration
    router?.navigateToLicenseInfoEntering(licenseType: nextLicenseType)
  }
}
