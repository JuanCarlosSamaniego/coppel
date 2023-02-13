//
//  SwiftUtils.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 10/02/23.
//
import Foundation
import UIKit

enum dataForAPI {
    static let APIKey = "ea4be36600db098a63343c56f1eba69b"
    static let complementForURL = "https://image.tmdb.org/t/p/w200"
}

enum BaseURL {
    static let BaseURLForMoview = "https://api.themoviedb.org/3/movie"
    static let BaseURLForTVShow = "https://api.themoviedb.org/3/tv"
}

enum endPoints {
    static let popularMovie = "/popular"
    static let topRated = "/top_rated"
    static let onTheAir = "/on_the_air"
    static let airingToday = "/airing_today"
}

