//
//  HomePresenter.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//
import Foundation

protocol HomePresenterProtocolForMovies: AnyObject {
    func updateViewWithMovies(datos: [PopularMovieEntity])
}

protocol HomePresenterProtocolForMoviesTopRated: AnyObject {
    func updateViewWithMoviesTopRated(datos: [PopularMovieEntity])
}

protocol HomePresenterProtocolOnTheAir: AnyObject {
    func updateViewWithDataOnTheAir(datos: [OnTheAirEntity])
}

protocol HomePresenterProtocolTvAiringToday: AnyObject {
    func updateViewWithDataTvAiringToday(datos: [OnTheAirEntity])
}


class HomePresenter {
    private let homeInteractor: HomeInteractor
    private let homeRouter: HomeRouter
    
    init(homeInteractor: HomeInteractor, homeRouter: HomeRouter) {
        self.homeInteractor = homeInteractor
        self.homeRouter = homeRouter
    }
    
    weak var uiForMovies: HomePresenterProtocolForMovies?
    weak var uiForMoviesTopRated: HomePresenterProtocolForMoviesTopRated?
    weak var uiForOnTheAir: HomePresenterProtocolOnTheAir?
    weak var uiForTvAiringToday: HomePresenterProtocolTvAiringToday?
    
    var modelsForMovies : [PopularMovieEntity] = []
    var modelsForMoviesTopRated : [PopularMovieEntity] = []
    var modelsForOnTheAir : [OnTheAirEntity] = []
    var modelsForTvAiringToday : [OnTheAirEntity] = []
    
    func onViewAppearMovies() {
        Task {
            modelsForMovies = await homeInteractor.getListOfMovies().results
            uiForMovies?.updateViewWithMovies(datos: modelsForMovies)
        }
    }
    func onViewAppearMoviesToRated() {
        Task {
            modelsForMoviesTopRated = await homeInteractor.getListOfMoviesTopRated().results
            uiForMoviesTopRated?.updateViewWithMoviesTopRated(datos: modelsForMoviesTopRated)
        }
    }
    
    func onViewApperOnTheAir() {
        Task {
            modelsForOnTheAir = await homeInteractor.getTvOnTheAir().results
            uiForOnTheAir?.updateViewWithDataOnTheAir(datos: modelsForOnTheAir)
        }
    }
    
    func onViewApperTvAiringToday() {
        Task {
            modelsForTvAiringToday = await homeInteractor.getTvAiringToday().results
            uiForTvAiringToday?.updateViewWithDataTvAiringToday(datos: modelsForTvAiringToday)
        }
    }
    
    func showNextView() {
        print("ShowNextViewPresenter")
        homeRouter.showNextView()
    }
}
