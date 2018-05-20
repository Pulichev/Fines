//
//  HomePageCell.swift
//  Fines
//
//  Created by Владислав Пуличев on 20.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

class HomePageCell: UITableViewCell {
  
  // MARK: Helpers
  
  public static var identifier: String {
    return String(describing: self)
  }
  
  // MARK: @IBOutlets
  
  @IBOutlet var infoLabel: UILabel!
  
  // MARK: Setup
  
  func setupCell(with text: String?) {
    infoLabel.text = text
  }
}
