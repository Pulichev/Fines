//
//  HomePageTableViewController.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

struct HomePageDataSource {
  
  var vehiclePlates:        [String]
  var vehicleRegistrations: [String]
  var driverRegistrations:  [String]
  
  init(vehiclePlates:        [String],
       vehicleRegistrations: [String],
       driverRegistrations:  [String]) {
    self.vehiclePlates        = vehiclePlates
    self.vehicleRegistrations = vehicleRegistrations
    self.driverRegistrations  = driverRegistrations
  }
}

class HomePageTableViewController: UITableViewController {
  
  // MARK: Properties
  
  var tableViewDataSource: HomePageDataSource?
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTableView()
  }
  
  // MARK: TableView functions
  
  public func reloadTableView(withData dataSource: HomePageDataSource) {
    tableViewDataSource = dataSource
    tableView.reloadData()
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView(frame: .zero)
  }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension HomePageTableViewController {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Номера"
    case 1:
      return "СТС"
    case 2:
      return "ВУ"
    default:
      return ""
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return tableViewDataSource?.vehiclePlates.count ?? 0
    case 1:
      return tableViewDataSource?.vehicleRegistrations.count ?? 0
    case 2:
      return tableViewDataSource?.driverRegistrations.count ?? 0
    default:
      return 0
    }
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCell.identifier,
                                             for: indexPath) as! HomePageCell
    let section = indexPath.section
    let row     = indexPath.row
    let text: String
    switch section {
    case 0:
      text = tableViewDataSource?.vehiclePlates[row] ?? ""
      break
    case 1:
      text = tableViewDataSource?.vehicleRegistrations[row] ?? ""
      break
    case 2:
      text = tableViewDataSource?.driverRegistrations[row] ?? ""
      break
    default:
      text = ""
      break
    }
    
    cell.setupCell(with: text)
    
    return cell
  }
}
