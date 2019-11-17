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

    private struct Response: Codable {
        let results: [User]
    }

    static func mock() -> UserModelController {
        do {
            let mock = UserModelController()
            let url = Bundle.main
                .url(forResource: "users", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder()
                .decode(Response.self, from: data).results
            mock.all = users
            return mock
        } catch {
            return UserModelController()
        }
    }

    func fetch(then completion: @escaping (Result<[User], Error>) -> Void) {
        let request = URL(string: "https://randomuser.me/api?page=1&results=20")!
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                (response as? HTTPURLResponse)?.statusCode == 200
            {
                do {
                    let response = try JSONDecoder()
                        .decode(Response.self, from: data)
                    completion(.success(response.results))
                } catch {
                    assertionFailure("\(error)")
                    completion(.failure(error))
                }
            } else {
                assertionFailure("request failed")
            }
        }.resume()
    }
}
