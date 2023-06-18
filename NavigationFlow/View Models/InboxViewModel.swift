//
//  InboxViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

class InboxViewModel: ObservableObject {
    let navTitle = "Inbox"
    enum State { case convos([Message]), loading }
    @Published var state: State = .loading
    
    func getInboxChats() async {
        Task {
            updateStateOnMainThread(.loading)
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            let models = [Message(), Message(), Message(), Message(), Message()]
            updateStateOnMainThread(.convos(models))
        }
    }
    
    private func updateStateOnMainThread(_ newState: State) {
        DispatchQueue.main.async {
            self.state = newState
        }
    }
}
