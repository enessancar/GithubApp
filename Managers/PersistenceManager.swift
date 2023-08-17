//
//  PersistenceManager.swift
//  GithubApp
//
//  Created by Enes Sancar on 31.07.2023.
//

import Foundation

enum PersistenceActionType {
    case add
    case remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completion: @escaping(CustomError?) -> ()) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll(where: { $0.login == favorite.login })
                }
                completion(save(favorites: favorites))
            case .failure(let failure):
                completion(failure)
            }
        }
    }
    
    static func retrieveFavorites(completion: @escaping(Result<[Follower], CustomError>) -> ()) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        do {
            let followers = try JSONDecoder().decode([Follower].self, from: favoritesData)
            completion(.success(followers))
        } catch {
            completion(.failure(.unableToFavorite))
        }
    }
    
    private static func save(favorites: [Follower]) -> CustomError? {
        do {
            let encodedFavorites = try JSONEncoder().encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return CustomError.unableToFavorite
        }
    }
}
