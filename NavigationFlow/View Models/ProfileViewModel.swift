//
//  ProfileViewModel.swift
//  NavigationFlow
//
//  Created by Colton Walker on 6/17/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    var navTitle = "Me"

    var id: String = ""
    var name: String = ""
    
    convenience init(user: User) {
        self.init()
        id = user.id
        name = user.name
        navTitle = user.name
    }
}
