// NetworkService.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

/// Primary API service object to get data
final class NetworkService {
    /// Shared singleton instance
    static let shared = NetworkService()

    /// Privatized constructor
    private init() {}

    /// Error types
    enum NetworkServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: NetworkRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(NetworkServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(NetworkServiceError.failedToGetData))
                return
            }

            // decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    private func request(from apiRequest: NetworkRequest) -> URLRequest? {
        guard let url = apiRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        return request
    }
}
