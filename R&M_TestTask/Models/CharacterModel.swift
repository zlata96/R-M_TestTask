// CharacterModel.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharacterModel

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let gender: CharacterGender
    let origin: OriginModel
    let imageString: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - OriginModel

struct OriginModel: Codable {
    let name: String
    let url: String
}

// MARK: - EpisodeModel

struct EpisodeModel: Codable {
    let id: Int
    let name: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

// MARK: - CharacterGender

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}
