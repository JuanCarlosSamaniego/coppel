//
//  HomeRouter.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//

import Foundation
import UIKit

class HomeRouter {
    var window: UIWindow?
    let  view = HomeViewController()
    func showHomeView(window: UIWindow?) {
       
        let navigation = UINavigationController(rootViewController: view)
        let  interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(homeInteractor: interactor, homeRouter: router)
        presenter.uiForMovies = view
        presenter.uiForMoviesTopRated = view
        presenter.uiForOnTheAir = view
        presenter.uiForTvAiringToday = view
        view.presenter = presenter
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    func showNextView() {
        print("showNextViewRouter")
    }
}


