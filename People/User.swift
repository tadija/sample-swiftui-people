//
//  User.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: Name
    let dob: Dob
    let picture: Picture
    let nat: String
}

extension User {
    struct Name: Codable {
        let first: String
        let last: String
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
