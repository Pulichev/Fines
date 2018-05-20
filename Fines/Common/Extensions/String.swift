//
//  String.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

extension String {
  
  /// Returns true if fully matches regex, false if not
  func matches(_ regex: String) -> Bool {
    return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
  }
  
  var cyrrilicTransliterated: String? {
    return self.replacingOccurrences(of: "A", with: "А")
    .replacingOccurrences(of: "B", with: "В")
    .replacingOccurrences(of: "E", with: "Е")
    .replacingOccurrences(of: "K", with: "К")
    .replacingOccurrences(of: "M", with: "М")
    .replacingOccurrences(of: "H", with: "Н")
    .replacingOccurrences(of: "O", with: "О")
    .replacingOccurrences(of: "P", with: "Р")
    .replacingOccurrences(of: "C", with: "С")
    .replacingOccurrences(of: "T", with: "Т")
    .replacingOccurrences(of: "Y", with: "У")
    .replacingOccurrences(of: "X", with: "Х")
  }
}
