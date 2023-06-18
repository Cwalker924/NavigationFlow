//
//  InboxView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct InboxView: View {
    @StateObject var viewModel: InboxViewModel
    
    var body: some View {
        NavigationStack {
            mainContentView
                .navigationTitle(viewModel.navTitle)
        }
    }
    
    @ViewBuilder
    var mainContentView: some View {
        switch viewModel.state {
        case .convos(let models):
            convoList(models)
        case .loading:
            ProgressView()
            // Fun Fact, this cant be located on the
            // top level because it will keep firing
            // with each data update creating an
            // infinite loop
                .task { await viewModel.getInboxChats() }
        }
    }
    
    func convoList(_ models: [Message]) -> some View {
        List(models) { vm in
            NavigationLink(value: vm) {
                VStack(alignment: .leading) {
                    Text(vm.user.name)
                    Text(vm.id)
                }.id(vm.id)
            }
        }
        .listStyle(.plain)
        .navigationDestination(for: Message.self) { model in
            VStack(alignment: .leading) {
                Text(model.user.name)
                Text(model.message)
            }
            .navigationTitle(model.user.name)
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView(viewModel: InboxViewModel())
    }
}
