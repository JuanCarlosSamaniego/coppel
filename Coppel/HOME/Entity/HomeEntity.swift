//
//  HomeEntity.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//
import Foundation

struct PopularMovieEntity: Decodable {
    var id: Int?
    var title: String?
    var overview: String?
    var poster_path: String?
    var vote_average: Double?
    var release_date: String?
    var backdrop_path: String?
}

struct PopularMovieResponseEntity: Decodable {
    let page: Int
    let results: [PopularMovieEntity]
    let total_results: Int?
    let total_pages: Int?
}
