//
//  CapabilitiesViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class CapabilitiesViewController: UIViewController {
  
  /// Using it exactly in view, cause we don't need to have presenter here
  var router: Router?
  
  // MARK: Properties
  
  let capabilitiesDataSource = CapabilitiesDataSource()
  var pageController: UIPageViewController!
  var currentIndex = 0 {
    didSet {
      changeButtonsVisibilityIfNeeded()
    }
  }
  var pendingIndex = 0
  var pageControllerIsAnimating = false
  
  // MARK: @IBOutlets
  
  @IBOutlet private var pageControllerContainerView: UIView!
  @IBOutlet var pageControl: UIPageControl!
  @IBOutlet private var nextCapabilityView: UIView!
  @IBOutlet private var goToFinesButton: UIButton!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initPageViewController()
    navigationController?.isNavigationBarHidden = true
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
    pageControl.numberOfPages = capabilitiesDataSource.count
    pageControl.currentPage = 0
  }
  
  func changeButtonsVisibilityIfNeeded() {
    let isLastPage = currentIndex == capabilitiesDataSource.count - 1
    if isLastPage {
      view.bringSubview(toFront: goToFinesButton)
    } else {
      view.bringSubview(toFront: nextCapabilityView)
    }
  }
  
  // MARK: @IBActions
  
  @IBAction func nextCapabilityButtonTapped(_ sender: Any) {
    scrollPageToNextIfPossible()
  }
  
  @IBAction func goToFinesButtonTapped(_ sender: UIButton) {
    router?.navigateToHomePage()
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
