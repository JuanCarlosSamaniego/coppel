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
    
    // For Movies entity and Response.
    var dataForResponse: PopularMovieResponseEntity?
    var modelsForMovies : [PopularMovieEntity] = []
    var modelsForMoviesTopRated : [PopularMovieEntity] = []
    
    // For TV Shows entity and Response.
    var dataForResponseTV: OnTheAirResponseEntity?
    var modelsForOnTheAir : [OnTheAirEntity] = []
    var modelsForTvAiringToday : [OnTheAirEntity] = []
    
    func onViewAppearMovies(page: Int) {
        Task {
            dataForResponse = await homeInteractor.getListOfMovies()
            if page <= dataForResponse?.total_pages ?? 1 {
                homeInteractor.pageNumber = page
                let moreDataForMovies = await homeInteractor.getListOfMovies().results
                moreDataForMovies.map { entity in
                    modelsForMovies.append(PopularMovieEntity(id: entity.id, title: entity.title, overview: entity.overview, poster_path: entity.poster_path, vote_average: entity.vote_average, release_date: entity.release_date, backdrop_path: entity.backdrop_path))
                }
                uiForMovies?.updateViewWithMovies(datos: modelsForMovies)
            }
        }
    }
    
    func onViewAppearMoviesToRated(page: Int) {
        Task {
            dataForResponse = await homeInteractor.getListOfMoviesTopRated()
            if page <= dataForResponse?.total_pages ?? 1 {
                homeInteractor.pageNumber = page
                let modelsForTopRated = await homeInteractor.getListOfMoviesTopRated().results
                modelsForTopRated.map { entity in
                    modelsForMoviesTopRated.append(PopularMovieEntity(id: entity.id, title: entity.title, overview: entity.overview, poster_path: entity.poster_path, vote_average: entity.vote_average, release_date: entity.release_date, backdrop_path: entity.backdrop_path))
                }
                uiForMoviesTopRated?.updateViewWithMoviesTopRated(datos: modelsForMoviesTopRated)
            }
        }
    }
    
    func onViewApperOnTheAir(page: Int) {
        Task {
            dataForResponseTV = await homeInteractor.getTvOnTheAir()
            if page <= dataForResponseTV?.total_pages ?? 1 {
                homeInteractor.pageNumber = page
                let modelsForAir = await homeInteractor.getTvOnTheAir().results
                modelsForAir.map { entity in
                    modelsForOnTheAir.append(OnTheAirEntity(id: entity.id, name: entity.name, overview: entity.overview, poster_path: entity.poster_path, vote_average: entity.vote_average, first_air_date: entity.first_air_date, backdrop_path: entity.backdrop_path))
                }
                uiForOnTheAir?.updateViewWithDataOnTheAir(datos: modelsForOnTheAir)
            }
        }
    }
    
    
    func onViewApperTvAiringToday(page: Int) {
        Task {
            dataForResponseTV = await homeInteractor.getTvAiringToday()
            if page <= dataForResponseTV?.total_pages ?? 1 {
                homeInteractor.pageNumber = page
                let _: [()] = await homeInteractor.getTvAiringToday().results.map({ entity in
                    modelsForTvAiringToday.append(OnTheAirEntity(id: entity.id, name: entity.name, overview: entity.overview, poster_path: entity.poster_path, vote_average: entity.vote_average, first_air_date: entity.first_air_date, backdrop_path: entity.backdrop_path)) })
                uiForTvAiringToday?.updateViewWithDataTvAiringToday(datos: modelsForTvAiringToday)
            }
        }
    }
    
    func showNextView() {
        print("ShowNextViewPresenter")
        homeRouter.showNextView()
    }
}
