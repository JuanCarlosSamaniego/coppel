//
//  DetailViewPresenter.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//

import Foundation

protocol DetailViewPresenterProtocolDetailForId: AnyObject {
    func updateViewWithDataForDetail(data: DetailMovieEntity)
}

protocol DetailViewPresenterProtocolDetailForTVShow: AnyObject {
    func updateViewWithDataForDetail(data: DetailViewForTVEntity)
}

class DetailViewPresenter {
    private let detailViewInteractor: DetailViewInteractor
    private let detailviewRouter: DetailViewRouter
    init(detailInteractor: DetailViewInteractor, detailviewRouter: DetailViewRouter) {
        self.detailViewInteractor = detailInteractor
        self.detailviewRouter = detailviewRouter
    }
    
    weak var uiForDetailView : DetailViewPresenterProtocolDetailForId?
    weak var uiForTvShow : DetailViewPresenterProtocolDetailForTVShow?
    
    var dataForDetailMovie: DetailMovieEntity?
    var dataForDetailTVShow: DetailViewForTVEntity?
    
   
    func  onViewAppearForCompanies() {
        Task {
          dataForDetailMovie = await detailViewInteractor.getDataToDetailIdSelected()
            uiForDetailView?.updateViewWithDataForDetail(data: dataForDetailMovie!)
        }
    }
    
    func onViewAppearForTVShows() {
        Task {
            dataForDetailTVShow = await detailViewInteractor.getDataToDetailForTV()
            uiForTvShow?.updateViewWithDataForDetail(data: dataForDetailTVShow!)
        }
    }
}
