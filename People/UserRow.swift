//
//  UserRow.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import SwiftUI

struct UserRow: View {
    let user: User

    var body: some View {
        NavigationLink(destination: UserDetail(user: user)) {
            HStack {
                Image(systemName: "photo")

                VStack(alignment: .leading) {
                    Text(user.name.description)
                    Text("Age: \(user.dob.age)")
                }

                Spacer()

                Text(user.nat)
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: .mocked)
    }
}
