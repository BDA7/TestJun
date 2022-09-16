//
//  NetworkQueries.swift
//  TestJun
//
//  Created by Данила on 31.08.2022.
//

import UIKit

class NetworkQueries {
    static func getProducts(urlString: String, completion: @escaping (Result<ModelsNetwork, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let products = try JSONDecoder().decode(ModelsNetwork.self, from: data)
                    completion(.success(products))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
                
            }
        }.resume()
    }
}

extension UIImageView {
    func load(link: String?) {
        if link != " ", link != nil {
            guard let url = URL(string: link ?? "" ) else { return }
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            self.backgroundColor = .black
        }
    }
}
