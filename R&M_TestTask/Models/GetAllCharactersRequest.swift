// GetAllCharactersRequest.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

// MARK: - GetAllCharactersRequest

struct GetAllCharactersRequest: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [CharacterModel]
}

// MARK: - GetSingleCharacterRequest

struct GetSingleCharacterRequest: Codable {
    let results: CharacterModel
}
