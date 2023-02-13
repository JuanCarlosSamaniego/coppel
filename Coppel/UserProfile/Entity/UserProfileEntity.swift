//
//  UserProfileEntity.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 11/02/23.
//

import Foundation

struct UserProfileEntity {
    var avatar: gravatar
    var id: Int
    var iso_639_1: String
    var iso_3166_1: String
    var name: String
    var include_adult: Bool
    var username: String
}
struct gravatar {
    var hash: String
}

