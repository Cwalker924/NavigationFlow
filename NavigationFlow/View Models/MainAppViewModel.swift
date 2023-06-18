//
//  MainAppViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation
import SwiftUI

class MainAppViewModel: ObservableObject {
    enum Tab { case feed, inbox, profile }
    @Published var tab: Tab = .feed
    
    @ObservedObject var feedViewModel = FeedViewModel()
    @ObservedObject var inboxViewModel = InboxViewModel()
    @ObservedObject var profileViewModel = ProfileViewModel()
    
    func configure(with user: User) {
        profileViewModel = ProfileViewModel(user: user)
    }
}


