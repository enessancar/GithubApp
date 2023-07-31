//
//  ErrorMessage.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
//

import Foundation

enum CustomError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the service. Please try again."
    case invalidData = "The data recieved from the service was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting user. Please try again."
    case alreadyInFavorites = "You've already favorited this user. You must really like them!"
    case invalidURL = "The given url was invalid. Please give real URL."
}
