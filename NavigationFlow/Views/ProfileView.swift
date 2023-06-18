//
//  ProfileView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

typealias ID = String
typealias TapAction = (ID)->()

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    var messageButtonTapped: TapAction
    
    var body: some View {
        VStack(spacing: 40) {
            avatarView
            nameView
            messageButton
            messageView
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var avatarView: some View {
        Image(systemName: "person")
            .font(.system(size: 100))
            .padding()
            .overlay(
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
    
    var nameView: some View {
        VStack {
            Text(viewModel.name)
                .font(.largeTitle)
                .bold()
            Text(viewModel.id)
        }
    }
    
    var messageButton: some View {
        Button {
            messageButtonTapped(viewModel.id)
        } label: {
            Text("Message")
                .font(.headline)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
        }
        .buttonStyle(.plain)
    }
    
    var messageView: some View {
        VStack(spacing: 30) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
                .frame(height: 40)
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
                .frame(height: 40)
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
                .frame(height: 60)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(), messageButtonTapped: { _ in })
    }
}
