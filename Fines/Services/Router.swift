//
//  Router.swift
//  Fines
//
//  Created by Владислав Пуличев on 18.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

import UIKit

protocol Router: class {
  
  func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
}

class RouterDefault: Router {
  
  public weak var window: UIWindow?
  public weak var navigationController: UINavigationController?
  
  public func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    navigationController?.present(viewController, animated: animated, completion: completion)
  }
}
