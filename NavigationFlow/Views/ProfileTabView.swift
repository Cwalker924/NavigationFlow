//
//  ProfileTabView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct ProfileTabView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            ProfileView(viewModel: viewModel, messageButtonTapped: { userId in
                viewModel.goToChat(userId: userId)
            })
            .navigationDestination(isPresented: $viewModel.showChatView) {
                if let chatViewModel = viewModel.selectedChatViewModel {
                    ChatView(viewModel: chatViewModel)
                }
            }
                .navigationTitle(viewModel.navTitle)
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView(viewModel: ProfileViewModel())
    }
}
