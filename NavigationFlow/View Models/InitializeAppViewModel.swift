//
//  InitializeAppViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

import SwiftUI
import Combine

enum AppState {
    case auth(AuthViewModel)
    case main(MainAppViewModel)
    case loading
}

class InitializeAppViewModel: ObservableObject {
    @Published var state: AppState = .loading
    @Published var isLoggedIn: Bool = false
    
    @ObservedObject var authViewModel = AuthViewModel()
    @ObservedObject var mainAppViewModel = MainAppViewModel()
    
    var subscriptions = Set<AnyCancellable>()
    // Would normally inject service here
    init() {
        setupSubscriptions()
    }
    
    // Makes more sense to have an Observable SessionManager and listen here with
    // a publisher/subscription
    func fetchUser() async {
        updateStateOnMainThread(.loading)
           Task {
               do {
                   try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                   if isLoggedIn {
                       let user = User()
                       mainAppViewModel.configure(with: user)
                       updateStateOnMainThread(.main(mainAppViewModel))
                   } else {
                       updateStateOnMainThread(.auth(authViewModel))
                   }
               } catch {
                   // handle error
                   print("Error in \(#function): \(error.localizedDescription)")
               }
           }
       }
       
       private func updateStateOnMainThread(_ newState: AppState) {
           DispatchQueue.main.async {
               self.state = newState
           }
       }
    
    func setupSubscriptions() {
        authViewModel.authenticatedUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                guard let self = self else { return }
                self.mainAppViewModel.configure(with: user)
                self.state = .main(self.mainAppViewModel)
            }
        .store(in: &subscriptions)
    }
}
