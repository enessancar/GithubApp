//
//  Follower.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
