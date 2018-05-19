//
//  CapabilitiesViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class CapabilitiesViewController: UIViewController {
  
  // MARK: Properties
  
  let capabilitiesInfoDataSource = CapabilitiesInfo()
  var pageController: UIPageViewController!
  var currentIndex = 0
  var pendingIndex = 0
  
  // MARK: @IBOutlets
  
  @IBOutlet private var pageControllerContainerView: UIView!
  @IBOutlet var pageControl: UIPageControl!
  @IBOutlet private var nextCapabilityView: UIView!
  @IBOutlet private var goToFinesButton: UIButton!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initPageViewController()
  }
  
  private func initPageViewController() {
    pageController = UIPageViewController(transitionStyle: .scroll,
                                          navigationOrientation: .horizontal,
                                          options: nil)
    pageController.view.frame = pageControllerContainerView.bounds
    
    pageController.delegate = self
    pageController.dataSource = self
    
    pageControllerContainerView.addSubview(pageController.view)
    
    if let previewViewController = createPreviewViewController(atIndex: 0) {
      pageController.setViewControllers([previewViewController],
                         direction: .forward,
                         animated: false,
                         completion: nil)
    }
    
    // Configure pageControl
    pageControl.numberOfPages = capabilitiesInfoDataSource.count
    pageControl.currentPage = 0
  }
  
  func changeButtonsVisibility(isLastPage: Bool) {
    if isLastPage {
      view.bringSubview(toFront: goToFinesButton)
    } else {
      view.bringSubview(toFront: nextCapabilityView)
    }
  }
  
  @IBAction func nextCapabilityButtonTapped(_ sender: Any) {
    scrollPageToNextIfPossible()
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
