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
    
    setupUI()
    
    licenseInfoEnteringPresenter?.viewDidLoad(withType: licenseType)
  }
  
  // MARK: UI configure
  
  private func setupUI() {
    let interfaceInfo = LicenseEnteringVCUIInfo(for: licenseType)
    licenseExampleImageView.image = UIImage(named: interfaceInfo.imageName)
    licenseInfoLabel.text = interfaceInfo.labelText
    licenseInfoTextField.placeholder = interfaceInfo.textFieldPlaceholderText
    
    licenseInfoTextField.delegate = self
    licenseInfoTextField.becomeFirstResponder()
    
    navigationController?.isNavigationBarHidden = false
  }
  
  // MARK: @IBActions
  
  @IBAction func licenseInfoTextFieldTextChanged(_ sender: UITextField) {
    let enteredText = sender.text ?? ""
    let enteredTextCyrrilicTransliterated = enteredText.cyrrilicTransliterated
    let enteredTextFormatted = enteredTextCyrrilicTransliterated?.uppercased() ?? ""
    sender.text = enteredTextFormatted
    rightBarButton.title = enteredText == "" ? "Пропустить" : "Далее"
    licenseInfoEnteringPresenter?.validate(enteredInfo: enteredTextFormatted)
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
    let licenseInfoText = licenseInfoTextField.text ?? ""
    if isValid || licenseInfoText == "" { // isValid or empty = skip
      rightBarButton.isEnabled = true
    } else {
      rightBarButton.isEnabled = false
    }
  }
}

// MARK: - UITextField delegate

extension LicenseInfoEnteringViewController: UITextFieldDelegate {
  
  // Restrict max length
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    guard let text = textField.text else { return true }
    let limitLength = licenseType == .plate ? 9 : 10
    let newLength = text.count + string.count - range.length
    return newLength <= limitLength
  }
}
