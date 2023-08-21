// ImageManager.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

class ImageManager {
    public func setupImage(imageURL: URL?, imageView: UIImageView) {
        fetchImage(imageURL: imageURL) { result in
            switch result {
            case let .success(data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    imageView.image = image
                }
            case let .failure(error):
                print(String(describing: error))
            }
        }
    }

    private func fetchImage(imageURL: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
