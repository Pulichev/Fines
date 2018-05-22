//
//  ServicesAssembly.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class ServicesAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(Router.self) { r in
      return RouterDefault()
      }
      .inObjectScope(.container)
    
    container.register(DatabaseClient.self) { r in
      return DatabaseClientDefault()
    }
    .inObjectScope(.container)
  }
}
