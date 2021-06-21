//
//  Gallery.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 19/06/21.
//

import Foundation

struct Gallery: Codable {
    let data: [Post]
}

enum GallerySection: String, CaseIterable {
    case hot = "hot"
    case top = "top"
    case user = "user"
}

enum GallerySort {
    case viral
    case top
    case time
    case rising
}

enum GalleryWindow {
    case day
    case week
    case month
    case year

}
