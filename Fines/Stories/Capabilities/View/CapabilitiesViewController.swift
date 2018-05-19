//
//  CapabilitiesViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class CapabilitiesViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  @IBAction func nextCapabilityButtonTapped(_ sender: Any) {
    
  }
}

extension CapabilitiesViewController {
  
  static public func assembleFromStoryboard() -> CapabilitiesViewController {
    let storyboardId = "Capabilities"
    let viewControllerId = "CapabilitiesViewController"
    let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: viewControllerId) as? CapabilitiesViewController else {
      fatalError("Could not load view controller from storyboard file: \(storyboardId)")
    }
    return vc
  }
}
