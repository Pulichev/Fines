//
//  OnboardingPresenter.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Foundation

// MARK: - LicenseInfoEnteringView protocol

protocol LicenseInfoEnteringView: class {
  
  func validationComplete(withResult isValid: Bool)
}

// MARK: - LicenseInfoEnteringPresenter protocol

protocol LicenseInfoEnteringPresenter: class {
  
  var router: Router? { set get }
  
  var licenseInfoEnteringInteractor: LicenseInfoEnteringInteractor? { set get }
  var licenseInfoEnteringView: LicenseInfoEnteringView? { set get }
  
  func viewDidLoad(withType type: LicenseType)
  func validate(enteredInfo text: String)
  
  func saveInfoIfPossible(text: String)
  func navigateToNextStep()
}

// MARK: - LicenseInfoEnteringPresenter protocol implementation

class LicenseInfoEnteringPresenterDefault: LicenseInfoEnteringPresenter {
  
  var router: Router?
  
  var licenseInfoEnteringInteractor: LicenseInfoEnteringInteractor?
  weak var licenseInfoEnteringView: LicenseInfoEnteringView?
  
  var licenseType: LicenseType = .plate
  
  func viewDidLoad(withType type: LicenseType) {
    licenseType = type
  }
  
  func validate(enteredInfo text: String) {
    let isValid: Bool
    if licenseType == .plate {
      isValid = LicensePlateValidator.validate(licensePlate: text)
    } else {
      isValid = DriverLicenseValidator.validate(licenseNumber: text)
    }
    licenseInfoEnteringView?.validationComplete(withResult: isValid)
  }
  
  func saveInfoIfPossible(text: String) {
    guard text != "" else { return } // skip tapped
    
    licenseInfoEnteringInteractor?.saveLicense(text, withType: licenseType)
  }
  
  func navigateToNextStep() {
    // check current type for getting next event
    switch licenseType {
    case .plate:
      router?.navigateToLicenseInfoEntering(licenseType: .vehicleRegistration)
    case .vehicleRegistration:
      router?.navigateToLicenseInfoEntering(licenseType: .driverRegistration)
    case .driverRegistration:
      router?.navigateToCapabilitiesPreview()
    }
  }
}
