//
//  HomePagePresenter.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

protocol HomePageView: class {
  
}

protocol HomePagePresenter: class {
  
  var router: Router? { set get }
  
  var homePageView: HomePageView? { set get }
}

class HomePagePresenterDefault: HomePagePresenter {
  
  var router: Router?
  
  weak var homePageView: HomePageView?
}
