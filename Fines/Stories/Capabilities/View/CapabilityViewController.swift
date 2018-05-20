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
  var capabilityImageViewAspectRatio: CGFloat = 1.0
  
  // MARK: @IBOutlets
  
  @IBOutlet private var capabilityDescriptionLabel: UILabel!
  @IBOutlet private var capabilityImageView: UIImageView!
  @IBOutlet private var capabilityImageViewHeightConstraint: NSLayoutConstraint!
  
  // for making text on center if no image
  @IBOutlet private var capabilityDescriptionLabelCenterVerticalyConstraint: NSLayoutConstraint!
  @IBOutlet private var capabilityDescriptionLabelBottomConstraint:          NSLayoutConstraint!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  private func setupUI() {
    capabilityDescriptionLabel.text = capabilityDescription
    
    if capabilityImageName != "" {
      capabilityImageView.image = UIImage(named: capabilityImageName)
      changeHeightConstraintForCapabilityImageView()
    } else {
      capabilityDescriptionLabelCenterVerticalyConstraint.priority = UILayoutPriority(rawValue: 1000)
      capabilityDescriptionLabelBottomConstraint.priority = UILayoutPriority(rawValue: 999)
    }
  }
  
  private func changeHeightConstraintForCapabilityImageView() {
    let capabilityImageViewWidth = capabilityImageView.frame.width
    let capabilityImageViewHeight = capabilityImageViewWidth / capabilityImageViewAspectRatio
    capabilityImageViewHeightConstraint.constant = capabilityImageViewHeight
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
