//
//  LicenseInfoEnteringInteractor.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

protocol LicenseInfoEnteringInteractor: class {
  
  var databaseClient: DatabaseCore? { set get }
  
  func saveLicensesInfo(_ info: LicensesEnteredInfoValues?)
}

class LicenseInfoEnteringInteractorDefault: LicenseInfoEnteringInteractor {
  
  var databaseClient: DatabaseCore?
  
  func saveLicensesInfo(_ info: LicensesEnteredInfoValues?) {
    guard let infoValues = info else { return }
    
    if infoValues.vehiclePlate != "" {
      saveVehiclePlateToDb(infoValues.vehiclePlate)
    }
    if infoValues.vehicleRegistration != "" {
      saveVehicleRegistrationToDb(infoValues.vehicleRegistration)
    }
    if infoValues.driverRegistration != "" {
      saveDriverRegistrationToDb(infoValues.driverRegistration)
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
