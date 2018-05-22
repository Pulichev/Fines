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
    let correspondenceDictionary: [String: String] = [
      "A": "А",
      "B": "В",
      "E": "Е",
      "K": "К",
      "M": "М",
      "H": "Н",
      "O": "О",
      "P": "Р",
      "C": "С",
      "T": "Т",
      "Y": "У",
      "X": "Х"
      ]
    
    var transliteratedSelf = self
    
    correspondenceDictionary.forEach {
      transliteratedSelf = transliteratedSelf.replacingOccurrences(of: $0.key, with: $0.value)
    }
    
    return transliteratedSelf
  }
}
