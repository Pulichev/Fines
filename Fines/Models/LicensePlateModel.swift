//
//  AutoNumberModel.swift
//  Fines
//
//  Created by Владислав Пуличев on 17.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

class LicensePlateModel {
  
  private var currentPlate = ""
  
  /// Validating current entered license plate
  ///
  /// - Parameter licensePlate: current text in text field
  /// - Returns: true if valid and false if not
  func validate(licensePlate: String) -> Bool {
    // TODO: translate items that on eng
    currentPlate = licensePlate.uppercased()
    
    if isUsualAutoPlate() { return true }
    if isTaxiAutoPlate()  { return true }
    if isMotoPlate()      { return true }
    
    return false
  }
  
  // MARK: Validating functions for different vehicle
  
  private func isUsualAutoPlate() -> Bool {
    let regex = "[А-Я]{1}[0-9]{3}[А-Я]{2}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
  
  private func isTaxiAutoPlate() -> Bool {
    let regex = "[А-Я]{2}[0-9]{3}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
  
  private func isMotoPlate() -> Bool {
    let regex = "[0-9]{4}[А-Я]{2}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
}
