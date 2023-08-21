// EpisodeModel.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

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
