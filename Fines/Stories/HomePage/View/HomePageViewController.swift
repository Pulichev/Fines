//
//  HomePageViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class HomePageViewController: UITableViewController {
  
  // MARK: Properties
  
  var tableViewDataSource: HomePageDataSource?
  
  // MARK: Dependencies
  
  var homePagePresenter: HomePagePresenter?
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTableView()
    
    homePagePresenter?.viewDidLoad()
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView(frame: .zero)
  }
}

// MARK: - HomePageView

extension HomePageViewController: HomePageView {
  
  func updateTableView(withData dataSource: HomePageDataSource) {
    tableViewDataSource = dataSource
    tableView.reloadData()
  }
}
