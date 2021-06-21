//
//  Constants.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 20/06/21.
//

import Foundation

struct CONSTANTS {
    static let BASELINK: String = "https://api.imgur.com/3"
    static let COMMON_HEADERS: [String: String] = [
        "Authorization": "Client-ID \(AppKeys.shared.clientId)"
    ]
}
