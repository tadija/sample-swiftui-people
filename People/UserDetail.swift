//
//  UserDetail.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    let user: User

    var body: some View {
        VStack {
            Image(systemName: "photo")
            Text("Age: \(user.dob.age)")
            Text(user.email)
        }
        .navigationBarTitle(Text(user.name.description))
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetail(user: User.mocked)
        }
    }
}
