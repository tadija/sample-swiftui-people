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
        VStack(spacing: 20) {
            RemoteImage(url: user.picture.large)
                .clipShape(Circle())
                .overlay(
                    Circle()
                    .stroke(Color.accentColor, lineWidth: 4)
                )
                .padding([.top], 20)

            Button(user.email) {
                print("send email to: \(self.user.email)")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .font(.headline)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(4)
            .padding()

            Spacer()
        }
        .navigationBarTitle(
            Text("\(user.name.description) (\(user.dob.age))")
        )
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetail(user: User.mocked)
        }
    }
}
