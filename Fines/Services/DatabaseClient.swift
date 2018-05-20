//
//  DatabaseClient.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import SQLite

protocol DatabaseCore: class {
  
  func insert(vehiclePlate: String)
  func insert(vehicleRegistration: String)
  func insert(driverRegistration: String)
  
  func selectAllVehiclePlates() -> [String]?
  func selectAllVehicleRegistrations() -> [String]?
  func selectAllDriverRegistration() -> [String]?
}

class DatabaseClientDefault: DatabaseCore {
  
  // MARK: Initializing
  
  var db: Connection
  
  // Tables
  let vehiclePlates        = Table("vehicleplates")
  let vehicleRegistrations = Table("vehicleregistrations")
  let driverRegistrations  = Table("driverregistrations")
  
  init() {
    let path = NSSearchPathForDirectoriesInDomains(
      .documentDirectory, .userDomainMask, true
      ).first!
    
    db = try! Connection("\(path)/db.sqlite3")
    createTablesIfNeeded()
  }
  
  private func createTablesIfNeeded() {
    createVehiclePlateTable()
    createVehicleRegistrationTable()
    createDriverRegistrationTable()
  }
  
  private func createVehiclePlateTable() {
    let id    = Expression<Int64>("id")
    let plate = Expression<String>("plate")
    
    do {
      try db.run(vehiclePlates.create { t in
        t.column(id, primaryKey: true)
        t.column(plate, unique: true)
      })
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  private func createVehicleRegistrationTable() {
    let id = Expression<Int64>("id")
    let registration = Expression<String>("registration")
    
    do {
      try db.run(vehicleRegistrations.create { t in
        t.column(id, primaryKey: true)
        t.column(registration, unique: true)
      })
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  private func createDriverRegistrationTable() {
    let id = Expression<Int64>("id")
    let registration = Expression<String>("registration")
    
    do {
      try db.run(driverRegistrations.create { t in
        t.column(id, primaryKey: true)
        t.column(registration, unique: true)
      })
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  // MARK: Logic functions
  
  func insert(vehiclePlate: String) {
    let stmt = try? db.prepare("INSERT INTO vehicleplates (plate) VALUES (\(vehiclePlate))")
    do {
      _ = try stmt?.run()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func insert(vehicleRegistration: String) {
    let stmt = try? db.prepare("INSERT INTO vehicleregistrations (registration) VALUES (\(vehicleRegistration))")
    do {
      _ = try stmt?.run()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func insert(driverRegistration: String) {
    let stmt = try? db.prepare("INSERT INTO driverregistratios (registration) VALUES (\(driverRegistration))")
    do {
      _ = try stmt?.run()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func selectAllVehiclePlates() -> [String]? {
    return nil
  }
  
  func selectAllVehicleRegistrations() -> [String]? {
    return nil
  }
  
  func selectAllDriverRegistration() -> [String]? {
    return nil
  }
}
