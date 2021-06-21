//
//  NetworkManager.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 19/06/21.
//

/*
 curl --location -g --request GET 'https://api.imgur.com/3/gallery/{{section}}/{{sort}}/{{window}}/{{page}}?showViral={{showViral}}&mature={{showMature}}&album_previews={{albumPreviews}}' \
 --header 'Authorization: Client-ID {{clientId}}'

 */
import Foundation
import Combine

protocol EndpointProtocol {
    var link: String { get }
    var queryParams: [URLQueryItem] { get }
    var bodyParams: [String: Any] { get }
    var headers: [String: Any] { get }
}
