//
//  AuthViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    enum State { case na, loading }
    @Published var state: State = .na
    
    var authenticatedUser = PassthroughSubject<User, Never>()
    
    func signInButtonTapped() {
        state = .loading
        Task {
            try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            authenticatedUser.send(User())
            DispatchQueue.main.async {
                self.state = .na
            }
        }
    }
}
