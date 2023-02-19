//
//  HomeOnTheAirEntity.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//
import Foundation

struct OnTheAirEntity: Decodable {
    var id: Int
    var name: String
    var overview: String
    var poster_path: String?
    var vote_average: Double
    var first_air_date: String
    var backdrop_path: String?
}

struct OnTheAirResponseEntity: Decodable {
    let page: Int
    let results: [OnTheAirEntity]
    let total_results: Int?
    let total_pages: Int?
}
