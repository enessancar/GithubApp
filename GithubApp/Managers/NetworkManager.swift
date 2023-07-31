//
//  NetworkManager.swift
//  GithubApp
//
//  Created by Enes Sancar on 30.07.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://api.github.com/users/"
    
    func getFollowers(for username: String, page: Int, completion: @escaping(Result<[Follower], CustomError>) -> ()) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.unableToComplete))
            }
        }
        task.resume()
    }
}
