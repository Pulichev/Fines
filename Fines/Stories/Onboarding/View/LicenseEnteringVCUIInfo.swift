//
//  LicenseEnteringVCUIInfo.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

struct LicenseEnteringVCUIInfo {
  
  var imageName: String
  var labelText: String
  var textFieldPlaceholderText: String
  
  init(for type: LicenseType) {
    switch type {
    case .plate:
      imageName = Assets.onboardingVehiclePlate.rawValue
      labelText = "Укажите регистрационный номер ТС"
      textFieldPlaceholderText = "A111AA 77"
      break
    case .vehicleRegistration:
      imageName = Assets.onboardingVehicleRegistration.rawValue
      labelText = "Укажите номер свидетельства о регистрации ТС"
      textFieldPlaceholderText = "77 АА 101010"
      break
    case .driverRegistration:
      imageName = Assets.onboardingDriverRegistration.rawValue
      labelText = "Укажите номер водительского удостоверения"
      textFieldPlaceholderText = "77 AA 101010"
      break
    }
  }
}
