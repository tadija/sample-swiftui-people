//
//  RemoteImage.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject private var imageLoader = ImageLoader()

    let placeholder: Image

    init(url: URL, placeholder: Image = .init(systemName: "photo")) {
        self.placeholder = placeholder
        imageLoader.load(from: url)
    }
    
    var body: some View {
        if let uiImage = self.imageLoader.image {
            return Image(uiImage: uiImage)
        } else {
            return placeholder
        }
    }
}
