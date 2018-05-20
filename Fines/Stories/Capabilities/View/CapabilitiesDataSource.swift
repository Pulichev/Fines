//
//  CapabilitiesInfo.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

struct CapabilitiesDataSource {
  
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
    
    let isIpad = UI_USER_INTERFACE_IDIOM() == .pad
    imageNames = [
      isIpad ? Assets.capabilitiesPushPad.rawValue
        : Assets.capabilitiesPushPhone.rawValue,
      isIpad ? Assets.capabilitiesPayPad.rawValue
        : Assets.capabilitiesPayPhone.rawValue,
      isIpad ? Assets.capabilitiesDiscountPad.rawValue
        : Assets.capabilitiesDiscountPhone.rawValue,
      Assets.capabilitiesBill.rawValue,
      Assets.capabilitiesRedeemed.rawValue,
      ""
    ]
  }
  
  var count: Int {
    return descriptions.count
  }
}
