//
//  PublisherExecuter.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 20/06/21.
//

import Foundation
import Combine

class GenericPublisher {
    func publish<T:Decodable>(endpoint: EndpointProtocol) throws -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint.link) else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        endpoint.headers.forEach { key, value in
            urlRequest.addValue(value as? String ?? "", forHTTPHeaderField: key)
        }
        
        CONSTANTS.COMMON_HEADERS.forEach{ key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
