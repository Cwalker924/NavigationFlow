//
//  FeedCellViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

class FeedCellViewModel: Identifiable {
    var id: String
    var user: User
    
    init(_ feed: Feed) {
        id = feed.id
        user = feed.user
    }
}

extension FeedCellViewModel: Hashable {
    static func == (lhs: FeedCellViewModel, rhs: FeedCellViewModel) -> Bool {
        rhs.id == lhs.id && rhs.user == lhs.user
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(user)
    }
}
