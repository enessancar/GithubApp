//
//  User.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
//

import Foundation

struct User: Decodable {
    let login: String
    let avatarURL: String
    let htmlURL: String
    var name, location, bio: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case name, location, bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
    }
    
    var _name: String {
        name ?? "No avaialable"
    }
    
    var _location: String {
        location ?? "No location"
    }
    
    var _bio: String {
        bio ?? "No bio available"
    }
}
