//
//  ChatViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    let userID: ID
    @Published var messages = Message.dummyMessages
    
    init(userId: ID) {
        self.userID = userId
    }
}
