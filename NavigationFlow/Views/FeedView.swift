//
//  FeedView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationStack {
            mainContentView
                .navigationTitle(viewModel.navTitle)
        }
    }
    
    @ViewBuilder
    var mainContentView: some View {
        switch viewModel.state {
        case .feed(let cellVM):
            feedList(cellVM)
        case .loading:
            ProgressView()
            // Fun Fact, this cant be located on the
            // top level because it will keep firing
            // with each data update creating an
            // infinite loop
                .task { await viewModel.getFeed() }
        }
    }
    
    func feedList(_ cellVM: [FeedCellViewModel]) -> some View {
        List(cellVM) { vm in
            NavigationLink(value: vm) {
               FeedCellView(viewModel: vm)
                    .id(vm.id)
            }
        }
        .listStyle(.plain)
        .navigationDestination(for: FeedCellViewModel.self) { model in
            let profileViewModel = ProfileViewModel(user: model.user)
            
            ProfileView(viewModel: profileViewModel, messageButtonTapped: { userId in
                viewModel.goToChat(userId: userId)
            })
        }
        .navigationDestination(isPresented: $viewModel.showChatView) {
            if let chatViewModel = viewModel.selectedChatViewModel {
                ChatView(viewModel: chatViewModel)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModel())
    }
}

