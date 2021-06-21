//
//  Key.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 20/06/21.
//

import Foundation

class AppKeys {
    static let shared = AppKeys()
    
    var clientId = ""
    var clientSecret = ""
    
    init() {
        guard let filePath = Bundle.main.path(forResource: "AppKeys", ofType: "plist") else {
            fatalError("Config file doesnt exist")
        }
        
        let plist = NSDictionary(contentsOfFile: filePath)
        
        clientId = plist?["clientId"] as? String ?? ""
        clientSecret = plist?["clientSecret"] as? String ?? ""
    }
}
