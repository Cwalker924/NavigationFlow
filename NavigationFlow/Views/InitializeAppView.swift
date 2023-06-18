//
//  InitializeAppView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct InitializeAppView: View {
    @StateObject var viewModel = InitializeAppViewModel()
    
    var body: some View {
        appEntrance
            .task {
                await viewModel.fetchUser()
            }
    }
    
    @ViewBuilder
    var appEntrance: some View {
        switch viewModel.state {
        case .auth(let authViewModel):
            AuthView(viewModel: authViewModel)
        case .main(let mainAppViewModel):
            MainAppView(viewModel: mainAppViewModel)
        case .loading:
            ProgressView()
        }
    }
}

struct InitializeAppView_Previews: PreviewProvider {
    static var previews: some View {
        InitializeAppView(viewModel: InitializeAppViewModel())
    }
}

