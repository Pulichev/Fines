//
//  DriverLicenseModel.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

class DriverLicenseModel {
  
  private var currentLicense = ""
  
  func validate(licenseNumber: String) -> Bool {
    currentLicense = licenseNumber.uppercased()
    
    return isCorrect
  }
  
  private var isCorrect: Bool {
    let regex = "[0-9]{2}[А-Я]{2}[0-9]{6}"
    
    return currentLicense.matches(regex)
  }
}

