//
//  LicenseInfoEnteringInteractor.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

protocol LicenseInfoEnteringInteractor: class {
  
  var databaseClient: DatabaseCore? { set get }
  
  func saveLicense(_ text: String, withType type: LicenseType)
}

class LicenseInfoEnteringInteractorDefault: LicenseInfoEnteringInteractor {
  
  var databaseClient: DatabaseCore?
  
  func saveLicense(_ text: String, withType type: LicenseType) {
    switch type {
    case .plate:
      saveVehiclePlateToDb(text)
      break
    case .vehicleRegistration:
      saveVehicleRegistrationToDb(text)
      break
    case .driverRegistration:
      saveDriverRegistrationToDb(text)
      break
    }
  }
  
  private func saveVehiclePlateToDb(_ vehiclePlate: String) {
    databaseClient?.insert(vehiclePlate: vehiclePlate)
  }
  
  private func saveVehicleRegistrationToDb(_ vehicleRegistration: String) {
    databaseClient?.insert(vehicleRegistration: vehicleRegistration)
  }
  
  private func saveDriverRegistrationToDb(_ driverRegistration: String) {
    databaseClient?.insert(driverRegistration: driverRegistration)
  }
}
