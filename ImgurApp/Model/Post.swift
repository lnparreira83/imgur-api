//
//  Post.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 20/06/21.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    let id: String
    let title: String?
    var link: String
}
