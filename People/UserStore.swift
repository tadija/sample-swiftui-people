//
//  UserModelController.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import Foundation

final class UserStore: ObservableObject {
    @Published private(set) var users: [User]

    private let dataLoader = UserDataLoader()

    init(users: [User] = []) {
        self.users = users
    }

    func load() {
        dataLoader.load { [weak self] (result) in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension User {
    static var mocked: User {
        return UserDataLoader.mock().first!
    }
}
