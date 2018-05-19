//
//  AutoNumberModel.swift
//  Fines
//
//  Created by Владислав Пуличев on 17.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

class LicensePlateValidator {
  
  /// Validating current entered license plate
  ///
  /// - Parameter licensePlate: current text in text field
  /// - Returns: true if valid, false if not
  static func validate(licensePlate: String) -> Bool {
    // TODO: translate items that on eng
    let uppercasedPlate = licensePlate.uppercased()
    
    let isValid = isUsualAutoPlate(uppercasedPlate)
      || isTaxiAutoPlate(uppercasedPlate)
      || isMotoPlate(uppercasedPlate)
    
    return isValid
  }
  
  // MARK: Validating functions for different vehicle
  
  private static func isUsualAutoPlate(_ plate: String) -> Bool {
    let regex = "[А-Я]{1}[0-9]{3}[А-Я]{2}[0-9]{2,3}"
    
    return plate.matches(regex)
  }
  
  private static func isTaxiAutoPlate(_ plate: String) -> Bool {
    let regex = "[А-Я]{2}[0-9]{3}[0-9]{2,3}"
    
    return plate.matches(regex)
  }
  
  private static func isMotoPlate(_ plate: String) -> Bool {
    let regex = "[0-9]{4}[А-Я]{2}[0-9]{2,3}"
    
    return plate.matches(regex)
  }
}
