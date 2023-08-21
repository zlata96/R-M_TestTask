// NetworkRequest.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

// MARK: - NetworkRequest

final class NetworkRequest {
    private enum Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }

    private let endPoint: NetworkEndpoint
    private let pathComponents: [String]

    private var urlString: String {
        setupURL()
    }

    var url: URL? {
        URL(string: urlString)
    }

    let httpMethod = "GET"

    init(
        endPoint: NetworkEndpoint,
        pathComponents: [String] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
    }

    private func setupURL() -> String {
        var string = Constants.baseURL
        string += "/\(endPoint.rawValue)/"
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += ",\($0)"
            }
        }
        return string
    }
}

extension NetworkRequest {
    static let listCharactersRequest = NetworkRequest(endPoint: .character)
}
