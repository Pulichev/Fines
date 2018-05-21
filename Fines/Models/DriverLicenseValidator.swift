//
//  DriverLicenseModel.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

class DriverLicenseValidator {
  
  /// Returns symbols, that can be on vehicle plates
  private static let driverLicenseSymbols = "[АВЕКМНОРСТУХ]"
  
  /// Validating current driver license of vehicle registration
  ///
  /// - Parameter licenseNumber: current text in text field
  /// - Returns: true if valid, false if not
  static func validate(licenseNumber: String) -> Bool {
    let licenseUppercased = licenseNumber.uppercased()
    
    return isValid(licenseUppercased)
  }
  
  private static func isValid(_ license: String) -> Bool {
    let regex = "\\d{2}\(driverLicenseSymbols){2}\\d{6}"
    
    return license.matches(regex)
  }
}
