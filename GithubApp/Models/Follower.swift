//
//  Follower.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
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
