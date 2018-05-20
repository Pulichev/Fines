//
//  HomePageViewController+Table.swift
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

// MARK: - UITableViewDelegate and UITableViewDataSource

extension HomePageViewController {
  
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
    let cell = super.tableView(tableView, cellForRowAt: indexPath)
    let section = indexPath.section
    let row     = indexPath.row
    switch section {
    case 0:
      cell.textLabel?.text = tableViewDataSource?.vehiclePlates[row]
      break
    case 1:
      cell.textLabel?.text = tableViewDataSource?.vehicleRegistrations[row]
      break
    case 2:
      cell.textLabel?.text = tableViewDataSource?.driverRegistrations[row]
      break
    default:
      break
    }
    
    return cell
  }
}
