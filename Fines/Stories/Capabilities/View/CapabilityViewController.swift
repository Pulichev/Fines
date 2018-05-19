//
//  CapabilityViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class CapabilityViewController: UIViewController {
  
  // MARK: Properties
  
  var index = 0
  var capabilityDescription = ""
  var capabilityImageName = ""
  
  // MARK: @IBOutlets
  
  @IBOutlet private var capabilityDescriptionLabel: UILabel!
  @IBOutlet private var capabilityImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    capabilityDescriptionLabel.text = capabilityDescription
    capabilityImageView.image = UIImage(named: capabilityImageName)
  }
}

extension CapabilityViewController {
  
  static public func assembleFromStoryboard() -> CapabilityViewController {
    let storyboardId = "Capabilities"
    let viewControllerId = "CapabilityViewController"
    let storyboard = UIStoryboard(name: "Capabilities", bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: viewControllerId) as? CapabilityViewController else {
      fatalError("Could not load view controller from storyboard file: \(storyboardId)")
    }
    return vc
  }
}
