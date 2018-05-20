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
  var licensesEnteredInfoValues: LicensesEnteredInfoValues? { set get }
  
  var licenseInfoEnteringInteractor: LicenseInfoEnteringInteractor? { set get }
  var licenseInfoEnteringView: LicenseInfoEnteringView? { set get }
  
  func viewDidLoad(withType type: LicenseType)
  func validate(enteredInfo text: String)
  
  func saveInfo(text: String)
  func navigateToNextStep(skippedCurrent: Bool)
}

// MARK: - LicenseInfoEnteringPresenter protocol implementation

class LicenseInfoEnteringPresenterDefault: LicenseInfoEnteringPresenter {
  
  var router: Router?
  var licensesEnteredInfoValues: LicensesEnteredInfoValues?
  
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
  
  func saveInfo(text: String) {
    switch licenseType {
    case .plate:
      licensesEnteredInfoValues?.vehiclePlate = text
    case .vehicleRegistration:
      licensesEnteredInfoValues?.vehicleRegistration = text
    case .driverRegistration:
      licensesEnteredInfoValues?.driverRegistration = text
    }
  }
  
  func navigateToNextStep(skippedCurrent: Bool) {
    // check current type for getting next event
    switch licenseType {
    case .plate:
      if skippedCurrent {
        router?.navigateToLicenseInfoEntering(licenseType: .driverRegistration)
      } else {
        router?.navigateToLicenseInfoEntering(licenseType: .vehicleRegistration)
      }
    case .vehicleRegistration:
      router?.navigateToLicenseInfoEntering(licenseType: .driverRegistration)
    case .driverRegistration:
      UserDefaults.standard.set(true, forKey: StoriesFinishedKeys.onboardingFinished.rawValue)
      licenseInfoEnteringInteractor?.saveLicensesInfo(licensesEnteredInfoValues)
      router?.navigateToCapabilitiesPreview()
    }
  }
}
