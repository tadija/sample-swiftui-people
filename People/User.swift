//
//  User.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID {
        return login.uuid
    }

    let name: Name
    let email: String
    let login: Login
    let dob: Dob
    let picture: Picture
    let nat: String
}

extension User {
    struct Name: Codable {
        let first: String
        let last: String
    }
    struct Login: Codable {
        let uuid: UUID
    }
    struct Dob: Codable {
        let date: String
        let age: Int
    }
    struct Picture: Codable {
        let large: URL
        let medium: URL
        let thumbnail: URL
    }
}

extension User.Name: CustomStringConvertible {
    var description: String {
        return "\(first) \(last)"
    }
}
