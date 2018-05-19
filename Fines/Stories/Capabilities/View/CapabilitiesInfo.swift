//
//  CapabilitiesInfo.swift
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
