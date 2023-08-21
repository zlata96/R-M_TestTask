// APIService.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

/// Primary API service object to get Rick and Morty data
final class APIService {
    /// Shared singleton instance
    static let shared = APIService()

    /// Privatized constructor
    private init() {}

    /// Error types
    enum APIServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: APIRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {}
}
