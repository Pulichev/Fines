//
//  String.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

extension String {
  
  func matches(_ regex: String) -> Bool {
    return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
  }
}
