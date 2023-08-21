// CharacterModel.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharacterModel

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let gender: CharacterGender
    let origin: OriginModel
    let status: String
    let image: String
    let species: String
    let type: String
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
    let airDate: String

    private enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id, name, episode
    }
}

// MARK: - CharacterGender

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}
