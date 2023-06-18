//
//  MainAppView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct MainAppView: View {
    @ObservedObject var viewModel: MainAppViewModel
    
    
    var body: some View {
        TabView(selection: $viewModel.tab) {
            FeedView(viewModel: viewModel.feedViewModel)
                .tabItem({ Image(systemName: "list.bullet.below.rectangle") })
                .tag(MainAppViewModel.Tab.feed)
            InboxView(viewModel: viewModel.inboxViewModel)
                .tabItem({ Image(systemName: "tray") })
                .tag(MainAppViewModel.Tab.inbox)
            ProfileTabView(viewModel: viewModel.profileViewModel)
                .tabItem({ Image(systemName: "person") })
                .tag(MainAppViewModel.Tab.profile)
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView(viewModel: MainAppViewModel())
    }
}
