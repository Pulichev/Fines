//
//  CapabilitiesPageViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

struct CapabilitiesInfo {
  
  let descriptions: [String]
  let imageNames:   [String]
  
  init() {
    descriptions = [
      "Получайте push-уведомления о новых штрафах",
      "Оплачивайте штрафы через приложение",
      "Скидка 50%",
      "Получайте квитанцию, как в банке",
      "Гарантия погашения в государственной базе данных",
      "Соблюдайте правила дорожного движения"
    ]
    
    imageNames = [
      "",
      "",
      "",
      "",
      "",
      ""
    ]
  }
  
  var count: Int {
    return descriptions.count
  }
}

class CapabilitiesPageViewController: UIPageViewController {
  
  let capabilitiesInfoDataSource = CapabilitiesInfo()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initPageViewController()
  }
  
  private func initPageViewController() {
    delegate = self
    dataSource = self
    
    if let previewViewController = createPreviewViewController(atIndex: 0) {
      setViewControllers([previewViewController],
                         direction: .forward,
                         animated: false,
                         completion: nil)
    }
    
    let pageControl = UIPageControl.appearance()
    pageControl.pageIndicatorTintColor = UIColor.lightGray
    pageControl.currentPageIndicatorTintColor = UIColor.black
    pageControl.backgroundColor = UIColor.clear
  }
}

// MARK: - UIPageViewControllerDelegate

extension CapabilitiesPageViewController: UIPageViewControllerDelegate {
}

extension CapabilitiesPageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var index = (viewController as? CapabilityViewController)?.index ?? 0
    
    if index == 0 {
      return nil
    }
    
    index -= 1
    
    return createPreviewViewController(atIndex: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as? CapabilityViewController)?.index ?? 0
    index += 1
    
    return createPreviewViewController(atIndex: index)
  }
  
  // MARK: - Create view controllers
  
  private func createPreviewViewController(atIndex index: Int) -> CapabilityViewController? {
    guard index >= 0 && index < capabilitiesInfoDataSource.count else {
      return nil
    }
    
    let vc = CapabilityViewController.assembleFromStoryboard()
    
    vc.index = index
    vc.capabilityDescription = capabilitiesInfoDataSource.descriptions[index]
    vc.capabilityImageName   = capabilitiesInfoDataSource.imageNames[index]
    
    return vc
  }
}
