//
//  ContentView.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var users: UserModelController
    
    var body: some View {
        Text(users.all.first?.name.last ?? "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
