//
//  DetailViewInteractor.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//

import Foundation

class DetailViewInteractor {
    
    var idElemtSelected = 0
    
//https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
    func getDataToDetailIdSelected() async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(idElemtSelected)?api_key=\(dataForAPI.APIKey)&language=en-US")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(DetailMovieEntity.self, from: data)
    }
    
    func getDataToDetailForTV() async ->  DetailViewForTVEntity {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(idElemtSelected)?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(DetailViewForTVEntity.self, from: data)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
