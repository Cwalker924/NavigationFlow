//
//  ChatView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        VStack {
            userId
            threadView
        }
    }
    
    var userId: some View {
        Text(viewModel.userID)
    }
    
    var threadView: some View {
        ScrollView {
            VStack(alignment: .trailing, spacing: 20) {
                ForEach(viewModel.messages, id:
                            \.self) { message in
                    Text(message)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel(userId: UUID().uuidString))
    }
}
