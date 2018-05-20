//
//  HomePageInteractor.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

// MARK: - HomePageInteractor

protocol HomePageInteractor: class {
  
  var homePageInteractorOutput: HomePageInteractorOutput? { set get }
  var databaseClient: DatabaseCore? { set get }
  
  func requestLicensesInfo()
}

// MARK: - HomePageInteractorOutput

protocol HomePageInteractorOutput: class {
  
  func requestForLicensesInfoCompleted(homePageDataSource: HomePageDataSource)
}

// MARK: - HomePageInteractor implementation

class HomePageInteractorDefault: HomePageInteractor {
  
  weak var homePageInteractorOutput: HomePageInteractorOutput?
  var databaseClient: DatabaseCore?
  
  func requestLicensesInfo() {
    let vehiclePlates        = databaseClient?.selectAllVehiclePlates()        ?? []
    let vehicleRegistrations = databaseClient?.selectAllVehicleRegistrations() ?? []
    let driverRegistrations  = databaseClient?.selectAllDriverRegistrations()  ?? []
    
    let homePageDataSource = HomePageDataSource(vehiclePlates:        vehiclePlates,
                                                vehicleRegistrations: vehicleRegistrations,
                                                driverRegistrations:  driverRegistrations)
    
    homePageInteractorOutput?.requestForLicensesInfoCompleted(homePageDataSource: homePageDataSource)
  }
}


