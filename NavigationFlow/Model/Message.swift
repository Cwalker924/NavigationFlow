//
//  Message.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

struct Message: Identifiable {
    var id: String
    var user: User
    var message: String
    
    init() {
        id = UUID().uuidString
        user = User()
        message = Message.dummyMessages.randomElement()!
    }
}

extension Message {
    static let dummyMessages = [
        "Hey, how's it going?",
        "Just wanted to say hi!",
        "Are you free later today?",
        "I'm running a bit late, be there soon!",
        "What's your favorite movie?",
        "Let's grab coffee sometime!",
        "I can't wait to see you!",
        "Do you have any weekend plans?",
        "Thinking of you. Miss you!",
        "Remember to bring your umbrella."
    ]
}

extension Message: Hashable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        rhs.id == lhs.id && rhs.user == lhs.user && rhs.message == lhs.message
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(user)
        hasher.combine(message)
    }
}
