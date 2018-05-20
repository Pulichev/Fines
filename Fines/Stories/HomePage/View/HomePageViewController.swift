//
//  HomePageViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
  
  // MARK: Dependencies
  
  var homePagePresenter: HomePagePresenter?
  
  // MARK: @IBOutlets
  
  @IBOutlet private var titleLabel: UILabel!
  
  var tableViewController: HomePageTableViewController!
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    homePagePresenter?.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let tableVC = segue.destination as? HomePageTableViewController {
      tableViewController = tableVC
    }
  }
}

// MARK: - HomePageView

extension HomePageViewController: HomePageView {
  
  func updateTableView(withData dataSource: HomePageDataSource) {
    tableViewController.reloadTableView(withData: dataSource)
  }
}
