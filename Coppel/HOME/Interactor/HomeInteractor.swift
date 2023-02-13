//
//  HomeInteractor.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//
import Foundation
class HomeInteractor {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "\(BaseURL.BaseURLForMoview)\(endPoints.popularMovie)?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
    func getListOfMoviesTopRated() async -> PopularMovieResponseEntity {
        let url = URL(string: "\(BaseURL.BaseURLForMoview)\(endPoints.topRated)?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
    func getTvOnTheAir() async -> OnTheAirResponseEntity {
        let url = URL(string:"\(BaseURL.BaseURLForTVShow)\(endPoints.onTheAir)?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(OnTheAirResponseEntity.self, from: data)
    }
    
    func getTvAiringToday()  async -> OnTheAirResponseEntity {
        let url = URL(string:"\(BaseURL.BaseURLForTVShow)\(endPoints.airingToday)?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(OnTheAirResponseEntity.self, from: data)
    }
}
