//
//  FeedCellView.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import SwiftUI

struct FeedCellView: View {
    let viewModel: FeedCellViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            avatarView
            messageView
        }
    }

    var avatarView: some View {
        VStack {
            Image(systemName: "person")
                .padding()
                .overlay(
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                )
            Text(viewModel.user.name)
                .font(.caption)
        }
    }
    
    var messageView: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .frame(maxWidth: .infinity)
            .frame(height: 80)
    }
}

struct FeedCellView_Previews: PreviewProvider {
    static var previews: some View {
        FeedCellView(viewModel: FeedCellViewModel(Feed()))
    }
}
