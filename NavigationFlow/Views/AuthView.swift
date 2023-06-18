//
//  AuthView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        Button {
            viewModel.signInButtonTapped()
        } label: {
            switch viewModel.state {
            case .na: Text("Sign on in!")
            case .loading: ProgressView().tint(.white)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(.blue)
        .cornerRadius(10)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: AuthViewModel())
    }
}
