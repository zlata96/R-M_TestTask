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
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(APIServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(APIServiceError.failedToGetData))
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

    private func request(from apiRequest: APIRequest) -> URLRequest? {
        guard let url = apiRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        return request
    }
}
