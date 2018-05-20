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
    let regex = "\(plateSymbols){1}\\d{3}\(plateSymbols){2}(([0][1-9])|([1-9](\\d{1,2})))"
    
    return plate.matches(regex)
  }
  
  private static func isTaxiAutoPlate(_ plate: String) -> Bool {
    let regex = "\(plateSymbols){2}\\d{3}(([0][1-9])|([1-9](\\d{1,2})))"
    
    return plate.matches(regex)
  }
  
  private static func isMotoPlate(_ plate: String) -> Bool {
    let regex = "\\d{4}\(plateSymbols){2}(([0][1-9])|([1-9](\\d{1,2})))"
    
    return plate.matches(regex)
  }
  
  /// Returns symbols, that can be on vehicle plates
  private static var plateSymbols: String {
    return "[АВЕКМНОРСТУХ]"
  }
}
