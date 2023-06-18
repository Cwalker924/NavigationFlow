//
//  User.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

struct User: Hashable {
    var id: String
    var name: String
    
    init() {
        id = UUID().uuidString
        name = User.names.randomElement()!
    }
}

extension User {
    private static let names = [
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Emma",
        "Frank",
        "Grace",
        "Henry",
        "Isabella",
        "Jack",
        "Katherine",
        "Liam",
        "Mia",
        "Noah",
        "Olivia",
        "Peter",
        "Quinn",
        "Rose",
        "Samuel",
        "Tessa",
        "Uma",
        "Victor",
        "Wendy",
        "Xavier",
        "Yara",
        "Zoe"
    ]
}
