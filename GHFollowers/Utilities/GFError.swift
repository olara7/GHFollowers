//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Oscar Lara on 9/19/22.
//

import Foundation

//Raw value of the enum is a String
//Ex: invalidUsername is of type ErrorMessage but it has .rawValue of String
enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid Response from the server. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them!"
}
