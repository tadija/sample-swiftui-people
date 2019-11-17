//
//  ImageLoader.swift
//  People
//
//  Created by Marko Tadić on 11/17/19.
//  Copyright © 2019 AE. All rights reserved.
//

import UIKit

final class ImageLoader: ObservableObject {
    @Published private(set) var image: UIImage?

    func load(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    self.image = UIImage(data: data)
                } else {
                    self.image = nil
                }
            }
        }.resume()
    }
}
