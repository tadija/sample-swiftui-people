//
//  UserDataLoader.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import Foundation

final class UserDataLoader {
    enum ResponseError: Error {
        case invalid(URLResponse?)
    }

    let url = URL(string: "https://randomuser.me/api?page=1&results=20")!

    func load(then completion: @escaping (Result<[User], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.sync {
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    do {
                        let response = try JSONDecoder()
                            .decode(Response.self, from: data ?? Data())
                        completion(.success(response.results))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(ResponseError.invalid(response)))
                }
            }
        }.resume()
    }

    static func mock() -> [User] {
        do {
            let url = Bundle.main
                .url(forResource: "users", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder()
                .decode(Response.self, from: data).results
            return users
        } catch {
            return []
        }
    }

    private struct Response: Codable {
        let results: [User]
    }
}
