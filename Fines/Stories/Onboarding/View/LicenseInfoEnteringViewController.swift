//
//  LicenseInfoEnteringViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

enum LicenseType {
  
  case plate
  case driverRegistration
  case vehicleRegistration
}

class LicenseInfoEnteringViewController: UIViewController {
  
  var licenseType: LicenseType = .plate // default
  
  // MARK: Dependencies
  
  public var licenseInfoEnteringPresenter: LicenseInfoEnteringPresenter?
  
  // MARK: @IBOutlets
  
  @IBOutlet private var licenseExampleImageView: UIImageView!
  @IBOutlet private var licenseInfoLabel: UILabel!
  @IBOutlet private var licenseInfoTextField: UITextField!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    licenseInfoEnteringPresenter?.viewDidLoad(withType: licenseType)
  }
  
  // MARK: UI configure
  
  private func setupUI() {
    switch licenseType {
    case .plate:
      let vehiclePlateImage = UIImage(named: Assets.onboardingVehiclePlate.rawValue)
      licenseExampleImageView.image = vehiclePlateImage
      licenseInfoLabel.text = "Укажите регистрационный номер ТС"
      licenseInfoTextField.placeholder = "A111AA 77"
      break
    case .vehicleRegistration:
      let vehiclePlateImage = UIImage(named: Assets.onboardingVehicleRegistration.rawValue)
      licenseExampleImageView.image = vehiclePlateImage
      licenseInfoLabel.text = "Укажите номер свидетельства о регистрации ТС"
      licenseInfoTextField.placeholder = "77 АА 101010"
      break
    case .driverRegistration:
      let vehiclePlateImage = UIImage(named: Assets.onboardingDriverRegistration.rawValue)
      licenseExampleImageView.image = vehiclePlateImage
      licenseInfoLabel.text = "Укажите номер водительского удостоверения"
      licenseInfoTextField.placeholder = "77 AA 101010"
      break
    }
  }
  
  @IBAction func licenseInfoTextFieldTextChanged(_ sender: UITextField) {
    let enteredText = sender.text ?? ""
    licenseInfoEnteringPresenter?.validate(enteredInfo: enteredText)
  }
}

// MARK: - LicenseInfoEnteringView

extension LicenseInfoEnteringViewController: LicenseInfoEnteringView {
  
  func validationComplete(withResult isValid: Bool) {
    print(isValid)
  }
}
