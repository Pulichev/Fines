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
  
  var licenseInfoEnteringPresenter: LicenseInfoEnteringPresenter?
  
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
    let enteredText = licenseInfoTextField.text ?? ""
    licenseInfoEnteringPresenter?.saveInfoIfPossible(text: enteredText)
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
