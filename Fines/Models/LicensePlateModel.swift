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
  /// - Returns: true if valid, false if not
  func validate(licensePlate: String) -> Bool {
    // TODO: translate items that on eng
    currentPlate = licensePlate.uppercased()
    
    return isUsualAutoPlate || isTaxiAutoPlate || isMotoPlate
  }
  
  // MARK: Validating functions for different vehicle
  
  private var isUsualAutoPlate: Bool {
    let regex = "[А-Я]{1}[0-9]{3}[А-Я]{2}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
  
  private var isTaxiAutoPlate: Bool {
    let regex = "[А-Я]{2}[0-9]{3}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
  
  private var isMotoPlate: Bool {
    let regex = "[0-9]{4}[А-Я]{2}[0-9]{2,3}"
    
    return currentPlate.matches(regex)
  }
}
