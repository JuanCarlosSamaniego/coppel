//
//  DetailViewRouter.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//
import Foundation
import UIKit

class DetailViewRouter {
    
    func showDetailViewForMovies(fromView: UIViewController, DataForDatail: Int) {
        let  view = DetailViewController()
        let  interactor = DetailViewInteractor()
        let router = DetailViewRouter()
        let presenter = DetailViewPresenter(detailInteractor: interactor, detailviewRouter: router)
        view.presenter = presenter
        presenter.uiForDetailView = view
        interactor.idElemtSelected = DataForDatail
        fromView.navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetailViewForOnTheAir(fromView: UIViewController, DataForDatail: Int) {
        let  view = DetailViewController()
        let  interactor = DetailViewInteractor()
        let router = DetailViewRouter()
        let presenter = DetailViewPresenter(detailInteractor: interactor, detailviewRouter: router)
        view.presenter = presenter
        view.isTVShow = true
        presenter.uiForTvShow = view
        interactor.idElemtSelected = DataForDatail
        fromView.navigationController?.pushViewController(view, animated: true)
    }
}
