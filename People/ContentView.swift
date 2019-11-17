//
//  ContentView.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: UserStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.users) { user in
                    UserRow(user: user)
                }
            }
            .navigationBarTitle("People")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store = UserStore(users: UserDataLoader.mock())

    static var previews: some View {
        ContentView()
            .environmentObject(store)
    }
}
