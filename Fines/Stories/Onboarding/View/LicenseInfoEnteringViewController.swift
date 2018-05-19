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
  case driver
  case vehicle
}

class LicenseInfoEnteringViewController: UIViewController {
  
  var licenseType: LicenseType?
  
  // MARK: @IBOutlets
  
  @IBOutlet private var licenseExampleImageView: UIImageView!
  @IBOutlet private var licenseInfoTextField: UITextField!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: UI configure
  
  private func setupUI() {
    guard let type = licenseType else { return }
    switch type {
    case .plate:
      break
    case .vehicle:
      break
    case .driver:
      break
    }
  }
}
