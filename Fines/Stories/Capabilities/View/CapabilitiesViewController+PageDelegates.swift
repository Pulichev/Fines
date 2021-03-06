//
//  CapabilitiesViewController+PageDelegates.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

// MARK: - UIPageViewControllerDelegate

extension CapabilitiesViewController: UIPageViewControllerDelegate {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          willTransitionTo pendingViewControllers: [UIViewController]) {
    pageControllerIsAnimating = true
    if let pendingCapabilityViewController = pendingViewControllers.first as? CapabilityViewController {
      pendingIndex = pendingCapabilityViewController.index
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                          previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed {
      currentIndex = pendingIndex
      pageControl.currentPage = currentIndex
      pageControllerIsAnimating = false
    }
  }
  
  // Manual change for next page
  func scrollPageToNextIfPossible() {
    guard !pageControllerIsAnimating else { return }
    let nextIndex = currentIndex + 1
    
    guard nextIndex < capabilitiesDataSource.count,
      let previewViewController = createPreviewViewController(atIndex: nextIndex) else { return }
    pageControllerIsAnimating = true
    pageController.setViewControllers([previewViewController],
                                      direction: .forward,
                                      animated: true)
    { isCompleted in
      if isCompleted {
        self.currentIndex = nextIndex
        self.pageControl.currentPage = nextIndex
        self.pageControllerIsAnimating = false
      }
    }
  }
}

// MARK: - UIPageViewControllerDataSource

extension CapabilitiesViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let capabilityViewController = viewController as? CapabilityViewController else { return nil }
    var index = capabilityViewController.index
    
    if index == 0 {
      return nil
    }
    
    index -= 1
    
    return createPreviewViewController(atIndex: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let capabilityViewController = viewController as? CapabilityViewController else { return nil }
    var index = capabilityViewController.index
    
    index += 1
    
    return createPreviewViewController(atIndex: index)
  }
  
  // MARK: - Create view controllers
  
  func createPreviewViewController(atIndex index: Int) -> CapabilityViewController? {
    guard index >= 0 && index < capabilitiesDataSource.count else {
      return nil
    }
    
    let vc = CapabilityViewController.assembleFromStoryboard()
    
    vc.index = index
    vc.capabilityDescription = capabilitiesDataSource.descriptions[index]
    vc.shouldShowFullImage   = capabilitiesDataSource.shouldShowFullImage[index]
    vc.capabilityImageName   = capabilitiesDataSource.imageNames[index]
    vc.capabilityImageViewAspectRatio = capabilitiesDataSource.imagesAspectRatios[index]
    
    return vc
  }
}

