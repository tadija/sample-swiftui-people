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
                RemoteImage(url: user.picture.thumbnail)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                    )

                VStack(alignment: .leading) {
                    Text(user.name.description)
                        .font(.headline)
                    Text("Age: \(user.dob.age)")
                        .font(.footnote)
                }
                .padding()

                Spacer()

                Text(user.nat)
                    .font(.caption)
                    .fontWeight(.black)
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: .mocked)
    }
}
