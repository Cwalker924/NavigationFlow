//
//  FeedViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    var navTitle = "Feed"
    // Would typically translate the `Feed` to some kind of view models 
    enum State { case feed([FeedCellViewModel]), loading }
    @Published var state: State = .loading
    
    @Published var showChatView: Bool = false
    @Published var selectedChatViewModel: ChatViewModel? {
        didSet { showChatView = selectedChatViewModel != nil }
    }
    
    func goToChat(userId: String) {
        selectedChatViewModel = ChatViewModel(userId: userId)
    }
    
    func getFeed() async {
        Task {
            updateStateOnMainThread(.loading)
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            let models = [Feed(), Feed(), Feed(), Feed(), Feed()]
            let cellVM = models.compactMap({ FeedCellViewModel($0) })
            updateStateOnMainThread(.feed(cellVM))
        }
    }
    
    private func updateStateOnMainThread(_ newState: State) {
        DispatchQueue.main.async {
            self.state = newState
        }
    }
}

