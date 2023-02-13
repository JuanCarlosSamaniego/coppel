//
//  DetailViewEntity.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//

import Foundation

struct DetailMovieEntity: Decodable {
    var adult: Bool?
    var backdrop_path: String?
    var budget: Int?
    var homepage: String?
    var id: Int?
    var imdb_id:String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [production_companies]?
    var production_countries: [production_countries]?
    var release_date: String?
    var revenue: Int?
    var  runtime: Int?
    var title: String?
    var vote_average: Double?
}

struct genres: Decodable {
    var id: Int?
    var name: String?
}
struct production_companies: Decodable {
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
}
struct production_countries: Decodable {
    var iso_3166_1: String?
    var name: String?
}
