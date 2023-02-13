//
//  HomeEntity.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//

import Foundation

struct PopularMovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var poster_path: String
    var vote_average: Double
    var release_date: String
    var backdrop_path: String    // puedo quitarlo
}

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
