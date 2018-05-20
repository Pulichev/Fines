//
//  WelcomeViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  // MARK: @IBOutlets
  
  @IBOutlet private var previewImageView: UIImageView!
  @IBOutlet private var previewImageViewHeightConstraint: NSLayoutConstraint!
  
  // MARK: Life cycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.isNavigationBarHidden = true
    
    customizePreviewImageView()
  }
  
  // MARK: Customize UI
  
  private func customizePreviewImageView() {
    let isIpad = UI_USER_INTERFACE_IDIOM() == .pad
    let aspectRatio = isIpad ? CGFloat(1187.0 / 1478.0) : CGFloat(945.0 / 1651.0)
    view.layoutIfNeeded()
    let previewImageViewWidth = previewImageView.frame.width
    previewImageViewHeightConstraint.constant = previewImageViewWidth / aspectRatio
  }
}
