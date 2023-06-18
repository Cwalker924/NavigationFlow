//
//  Feed.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

struct Feed: Identifiable {
    var id = UUID().uuidString
    var user = User()
}

extension Feed: Hashable {
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
}
