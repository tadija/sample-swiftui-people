//
//  UserModelController.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import Foundation

final class UserModelController: ObservableObject {
    @Published private(set) var all: [User] = []

    init() {
        load()
    }

    func load() {
        DispatchQueue.global().async { [weak self] in
            self?.fetch { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let users):
                        self?.all = users
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

    func fetch(then completion: @escaping (Result<[User], Error>) -> Void) {
        let request = URL(string: "https://randomuser.me/api?page=1&results=20")!
        struct Response: Codable {
            let results: [User]
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                (response as? HTTPURLResponse)?.statusCode == 200
            {
                do {
                    let response = try JSONDecoder()
                        .decode(Response.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            } else {
                assertionFailure("request failed")
            }
        }.resume()
    }
}
