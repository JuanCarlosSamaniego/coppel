//
//  DetailViewForTV.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 12/02/23.
//

import Foundation


struct DetailViewForTVEntity: Decodable {
    var  backdrop_path: String?
    var first_air_date: String?
    var homepage: String?
    var id: Int?
    var last_episode_to_air: last_episode_to_air?
    var production_companies: [production_companies]?
}

struct last_episode_to_air: Decodable {
    var  air_date: String?
    var  episode_number: Int?
    var  id: Int?
    var name: String?
    var overview: String?
    var  production_code: String?
    var  season_number: Int?
    var still_path: String?
    var vote_average: Double?
    var vote_count: Int?
}


