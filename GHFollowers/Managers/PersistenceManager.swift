//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Oscar Lara on 12/30/22.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    //Pass a follower to function that we are adding or removing, GFError if not able to do it
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                //Change function depending on action type
                switch actionType {
                case .add:
                    //Check if the user is already favorited
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    //Add to favorites
                    retrievedFavorites.append(favorite)
                    
                    
                case .remove:
                    //Remove favorite by removing all instances of the deleted username
                    retrievedFavorites.removeAll { $0.login == favorite.login}
                }
                
                //Save back to user defaults
                completed(save(favorites: retrievedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    //on succes returns an array of followers, on error returns a GFError
    //Retrieve data and decoding it into an array of followers
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            //If there are no favorites, send back an empty array
            completed(.success([]))
            return
        }
        
        //Decode data into an array of followers and return that through the success case of the result type as
        // our array of followers that is also called favorites, if not we are going to send the error of unable
        // to favorite through the failure case of the result type
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
                completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    //Encode it as data, saving the data in the user defaults
    static func save(favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            
            //Returning nil because there is no GFError
            return nil
        } catch {
            return .unableToFavorite
        }

    }
}
