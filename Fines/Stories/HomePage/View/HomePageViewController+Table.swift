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
      return tableViewDataSource?.vehiclePlates.count ?? 2
    case 1:
      return tableViewDataSource?.vehicleRegistrations.count ?? 2
    case 2:
      return tableViewDataSource?.driverRegistrations.count ?? 2
    default:
      return 0
    }
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.detailTextLabel?.text = "123"
    
    return cell
  }
}
