// APIRequest.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

final class APIRequest {
    private enum Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }

    private let endPoint: APIEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]

    private var urlString: String {
        var string = Constants.baseURL
        string += "/\(endPoint.rawValue)"
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")

            string += argumentString
        }
        return string
    }

    var url: URL? {
        URL(string: urlString)
    }

    let httpMethod = "GET"

    /// Constract request
    init(
        endPoint: APIEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
