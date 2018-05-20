//
//  HomePagePresenter.swift
//  Fines
//
//  Created by Владислав Пуличев on 19.05.2018.
//  Copyright © 2018 Владислав Пуличев. All rights reserved.
//

// MARK: - HomePageView

protocol HomePageView: class {
  
  func updateTableView(withData dataSource: HomePageDataSource)
}

// MARK: - HomePagePresenter

protocol HomePagePresenter: class {
  
  var router: Router? { set get }
  
  var homePageInteractor: HomePageInteractor? { set get }
  var homePageView: HomePageView? { set get }
  
  func viewDidLoad()
}

// MARK: - HomePagePresenter implementation

class HomePagePresenterDefault: HomePagePresenter {
  
  var router: Router?
  
  var homePageInteractor: HomePageInteractor?
  weak var homePageView: HomePageView?
  
  func viewDidLoad() {
    homePageInteractor?.requestLicensesInfo()
  }
}

// MARK: - HomePageInteractorOutput

extension HomePagePresenterDefault: HomePageInteractorOutput {
  
  func requestForLicensesInfoCompleted(homePageDataSource: HomePageDataSource) {
    homePageView?.updateTableView(withData: homePageDataSource)
  }
}
