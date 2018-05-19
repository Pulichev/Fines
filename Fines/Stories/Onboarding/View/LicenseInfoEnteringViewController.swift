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

struct LicenseEnteringVCUIInfo {
  
  var imageName: String
  var labelText: String
  var textFieldPlaceholderText: String
  
  init(for type: LicenseType) {
    switch type {
    case .plate:
      imageName = Assets.onboardingVehiclePlate.rawValue
      labelText = "Укажите регистрационный номер ТС"
      textFieldPlaceholderText = "A111AA 77"
      break
    case .vehicleRegistration:
      imageName = Assets.onboardingVehicleRegistration.rawValue
      labelText = "Укажите номер свидетельства о регистрации ТС"
      textFieldPlaceholderText = "77 АА 101010"
      break
    case .driverRegistration:
      imageName = Assets.onboardingDriverRegistration.rawValue
      labelText = "Укажите номер водительского удостоверения"
      textFieldPlaceholderText = "77 AA 101010"
      break
    }
  }
}

class LicenseInfoEnteringViewController: UIViewController {
  
  var licenseType: LicenseType = .plate // default
  
  // MARK: Dependencies
  
  public var licenseInfoEnteringPresenter: LicenseInfoEnteringPresenter?
  
  // MARK: @IBOutlets
  
  @IBOutlet private var licenseExampleImageView: UIImageView!
  @IBOutlet private var licenseInfoLabel: UILabel!
  @IBOutlet private var licenseInfoTextField: UITextField!
  
  @IBOutlet private var rightBarButton: UIBarButtonItem!
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.isNavigationBarHidden = true
    
    setupUI()
    
    licenseInfoEnteringPresenter?.viewDidLoad(withType: licenseType)
  }
  
  // MARK: UI configure
  
  private func setupUI() {
    let interfaceInfo = LicenseEnteringVCUIInfo(for: licenseType)
    licenseExampleImageView.image = UIImage(named: interfaceInfo.imageName)
    licenseInfoLabel.text = interfaceInfo.labelText
    licenseInfoTextField.placeholder = interfaceInfo.textFieldPlaceholderText
  }
  
  @IBAction func licenseInfoTextFieldTextChanged(_ sender: UITextField) {
    let enteredText = sender.text ?? ""
    rightBarButton.title = enteredText == "" ? "Пропустить" : "Далее"
    licenseInfoEnteringPresenter?.validate(enteredInfo: enteredText)
  }
  
  @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {
    licenseInfoEnteringPresenter?.navigateToNextStep()
  }
}

// MARK: - LicenseInfoEnteringView

extension LicenseInfoEnteringViewController: LicenseInfoEnteringView {
  
  func validationComplete(withResult isValid: Bool) {
    if isValid {
      rightBarButton.isEnabled = true
    } else {
      rightBarButton.isEnabled = false
    }
  }
}
