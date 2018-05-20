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
  let imagesAspectRatios: [CGFloat]
  
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
    
    imagesAspectRatios = [
      isIpad ? CGFloat(1182.0 / 1578.0) : CGFloat(945.0 / 1721.0),
      isIpad ? CGFloat(1186.0 / 1596.0) : CGFloat(1056.0 / 1870.0),
      isIpad ? CGFloat(1187.0 / 1683.0) : CGFloat(1040.0 / 1890.0),
      CGFloat(944.0 / 1465.0),
      CGFloat(1033.0 / 1459.0),
      0.0
    ]
  }
  
  var count: Int {
    return descriptions.count
  }
}
