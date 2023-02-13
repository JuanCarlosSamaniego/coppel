//
//  UserProfileInteractor.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//

import Foundation



class UserProfileInteractor {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(dataForAPI.APIKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
//https://api.themoviedb.org/3/account?api_key=<<api_key>>
    
    
}
